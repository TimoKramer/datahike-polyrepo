package datahike.java;

import clojure.java.api.Clojure;
import clojure.lang.PersistentHashSet;
import clojure.lang.PersistentVector;
import org.junit.Test;

import java.util.*;
import java.util.stream.Stream;

import static datahike.java.Datahike.dConn;
import static datahike.java.Util.*;
import static org.junit.Assert.*;

public class DatahikeTest {

    private String uri = "datahike:mem://test-empty-db";
    private Object conn;

    private Object schema = Clojure.read(" [{:db/ident :name\n" +
            "                 :db/valueType :db.type/string\n" +
            "                 :db/unique :db.unique/identity\n" +
            "                 :db/index true\n" +
            "                 :db/cardinality :db.cardinality/one}\n" +
            "                {:db/ident :age\n" +
            "                 :db/valueType :db.type/long\n" +
            "                 :db/cardinality :db.cardinality/one}]");
    private Date firstDate;
    private String query;

    @org.junit.Before
    public void setUp() throws Exception {
        Datahike.deleteDatabase(uri);
    }

    @org.junit.After
    public void tearDown() throws Exception {
    }

    private void transactOnce() {
        Datahike.createDatabase(uri, k(":initial-tx"), schema);

        conn = Datahike.connect(uri);
        query = "[:find ?n ?a :where [?e :name ?n] [?e :age ?a]]";

        Datahike.transact(conn, vec(
                map(k(":name"), "Alice", k(":age"), 25L),
                map(k(":name"), "Bob", k(":age"), 30L)));
    }

    @org.junit.Test
    public void queryWithDBAndInput() {
        transactOnce();
        query = "[:find ?n ?a :in $ [?n] :where [?e :name ?n] [?e :age ?a]]";
        Set<PersistentVector> res = Datahike.q(query, dConn(conn), "[\"Alice\"]");
        Object[] names = res.stream().map(vec -> vec.get(0)).toArray();
        assertTrue(names[0].equals("Alice"));
    }

    @org.junit.Test
    public void queryWithLocalInputDB() {
        String input = "[[1 :name 'Ivan'] [1 :age  19] [1 :aka  \"dragon_killer_94\"] [1 :aka  '-=autobot=-']]";
        Set res = Datahike.q("[:find  ?n ?a :where [?e :aka \"dragon_killer_94\"] [?e :name ?n] [?e :age  ?a]]", input);
        assertTrue(res.size() == 1);
    }

    @org.junit.Test
    public void queryWithDB() {
        Datahike.createDatabase(uri);
        conn = Datahike.connect(uri);

        // Transacting new schema
        Datahike.transact(conn, vec(map(k(":db/ident"), k(":name"),
                k(":db/valueType"), k(":db.type/string"),
                k(":db/cardinality"), k(":db.cardinality/one"))));

        // Transacting with schema presence
        Datahike.transact(conn, vec(map(k(":name"), "Alice")));

        Object dConn = deref.invoke(conn);

        Set res = Datahike.q("[:find ?e :where [?e :name]]", dConn);
        assertTrue(res.size() == 1);

        res = Datahike.q("[:find ?v :where [_ :name ?v]]", dConn);
        //Assert.assertEquals("Alice", ((List)res.toArray()[0]).iterator().next());
        assertEquals(PersistentHashSet.create(Arrays.asList(PersistentVector.create("Alice"))), res);
    }

    @org.junit.Test
    public void history() {
        transactOnce();

        Set<PersistentVector> res = Datahike.q((String) query, Datahike.history(dConn(conn)));
        Object[] names = res.stream().map(pv -> pv.get(0)).toArray();
        assertEquals(new String[] {"Alice", "Bob"}, names);
    }

    @Test
    public void asOfAndSince() {
        transactOnce();

        firstDate = new Date();
        Datahike.transact(conn, vec(map(
                k(":db/id"), vec(k(":name"), "Alice"),
                k(":age"), 30L)));

        Set res = Datahike.q(query, Datahike.asOf(dConn(conn), firstDate));
        // TODO: add better assert
        assertEquals(2, res.size());

        res = Datahike.q(query, Datahike.since(dConn(conn), firstDate));
        // 0, because :name was transacted before the first date
        assertEquals(0, res.size());
    }

    @Test
    public void pullAndPullMany() {
        transactOnce();

        Datahike.transact(conn, vec(map(k(":db/id"), 10,
                                        k(":name"), "Joe",
                                        k(":age"), 50L)));
        Map res = Datahike.pull(dConn(conn), "[*]", 10);
        assertEquals("Joe", res.get(k(":name")));

        res = Datahike.pull(dConn(conn), "[*]", vec(k(":name"), "Alice"));
        assertEquals("Alice", res.get(k(":name")));


        Datahike.transact(conn, vec(map(k(":db/id"), 20,
                k(":name"), "Jane",
                k(":age"), 25L)));
        List list = Datahike.pullMany(dConn(conn), "[*]", vec(10, 20));
        assertEquals(2, list.size());
    }

    @Test
    public void release() {
        Datahike.createDatabase(uri, k(":initial-tx"), schema);
        conn = Datahike.connect(uri);
        Datahike.release(conn);
    }

    @Test
    public void seekDatoms() {
        Datahike.createDatabase(uri, k(":initial-tx"), schema);
        conn = Datahike.connect(uri);

        Datahike.transact(conn, (PersistentVector)Clojure.read("[{:db/id 10 :name \"Petr\" :age 44} {:db/id 20 :name \"Ivan\" :age 25} {:db/id 30 :name \"Sergey\" :age 11}]"));
        List res = Datahike.seekdatoms(dConn( conn), k(":eavt"), 10);
        // TODO: Add assertion
        res = Datahike.seekdatoms(dConn( conn), k(":eavt"), 10, k(":name"));
        // TODO: Add assertion
        res = Datahike.seekdatoms(dConn( conn), k(":eavt"), 30, k(":name"), "Sergey");
        // TODO: Add assertion
    }

    @Test
    public void tempId() {
        Long id = Datahike.tempId(k(":db.part/user"));
        assertTrue(id < 0);
        id = Datahike.tempId(k(":db.part/user"), -10000L);
        assertEquals(-10000L, (long)id);
    }

    @Test
    public void entity() {
        transactOnce();
        Datahike.transact(conn, vec(map(k(":db/id"), 10,
                k(":name"), "Joe",
                k(":age"), 50L)));

        IEntity entity = Datahike.entity(dConn(conn), 10);
        Object res = entity.valAt(k(":name"));
        assertEquals("Joe", res);
    }

    @Test
    public void entityDb() {
        transactOnce();
        Datahike.transact(conn, vec(map(k(":db/id"), 10,
                k(":name"), "Joe",
                k(":age"), 50L)));
        Object entity = Datahike.entity(dConn(conn), 10);

        Object db = Datahike.entityDb(entity);
        assertNotNull(db);
    }

    @Test
    public void filterAndIsFiltered() {
        Datahike.createDatabase(uri, k(":initial-tx"), schema);
        conn = Datahike.connect(uri);
        assertFalse(Datahike.isFiltered(dConn(conn)));

        Datahike.transact(conn, (PersistentVector)Clojure.read("[{:db/id 10 :name \"Petr\" :age 44} {:db/id 20 :name \"Ivan\" :age 25} {:db/id 30 :name \"Sergey\" :age 11}]"));
        Object filteredDB = Datahike.filter(dConn(conn), Clojure.read("(fn [_ datom] (not= :age (:a datom)))"));
        assertTrue(Datahike.isFiltered(filteredDB));
    }

    @Test
    public void with() {
        Datahike.createDatabase(uri, k(":initial-tx"), schema);
        conn = Datahike.connect(uri);

        PersistentVector txData = (PersistentVector)Clojure.read("[{:db/id 10 :name \"Petr\" :age 44} {:db/id 20 :name \"Ivan\" :age 25} {:db/id 30 :name \"Sergey\" :age 11}]");
        Object res = Datahike.with(dConn(conn), txData);
        // TODO: assert
    }

    // TODO: datom? Create an Java Interface for it?
    // TODO: Try to use java streams to visit the (query) results
}
