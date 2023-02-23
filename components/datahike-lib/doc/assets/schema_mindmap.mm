<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Schema" FOLDED="false" ID="ID_719964605" CREATED="1556788151293" MODIFIED="1556807930180" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.189">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="16" RULE="ON_BRANCH_CREATION"/>
<node TEXT="transaction validation" POSITION="right" ID="ID_1829926443" CREATED="1556788185051" MODIFIED="1556790965259" HGAP_QUANTITY="37.999999284744284 pt" VSHIFT_QUANTITY="-23.99999928474429 pt">
<edge COLOR="#ff0000"/>
<node TEXT="transact hooks" ID="ID_1508954708" CREATED="1556788576501" MODIFIED="1556788584687"/>
<node TEXT="db query against :db/* schema" ID="ID_943074358" CREATED="1556789127180" MODIFIED="1556790362472"/>
</node>
<node TEXT="supported value types" POSITION="left" ID="ID_1387082155" CREATED="1556788214157" MODIFIED="1556807839915" HGAP_QUANTITY="131.74999649077662 pt" VSHIFT_QUANTITY="-15.749999530613437 pt">
<edge COLOR="#0000ff"/>
<node TEXT="default" ID="ID_718527557" CREATED="1556788592822" MODIFIED="1556807721741">
<node TEXT="::Any for schema-on-read or not specified" ID="ID_349972306" CREATED="1556788772992" MODIFIED="1556807684756" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="-15.749999530613437 pt"/>
<node TEXT="datomic types" ID="ID_725779683" CREATED="1556788901647" MODIFIED="1556807651802" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="17.249999485909953 pt"/>
</node>
<node TEXT="additional" ID="ID_440282733" CREATED="1556788636839" MODIFIED="1556807804500" HGAP_QUANTITY="92.74999765306718 pt" VSHIFT_QUANTITY="47.2499985918403 pt">
<node TEXT="bytes" ID="ID_1224799053" CREATED="1556788742844" MODIFIED="1556807800977" HGAP_QUANTITY="35.74999935179951 pt" VSHIFT_QUANTITY="-10.499999687075624 pt"/>
<node TEXT="crdts" ID="ID_632171612" CREATED="1556788746840" MODIFIED="1556807804500" HGAP_QUANTITY="39.4999992400408 pt" VSHIFT_QUANTITY="3.749999888241293 pt"/>
<node TEXT="keyword" ID="ID_640262267" CREATED="1556807712858" MODIFIED="1556807802955" HGAP_QUANTITY="22.249999754130847 pt" VSHIFT_QUANTITY="17.249999485909953 pt"/>
</node>
</node>
<node TEXT="migration" POSITION="left" ID="ID_357083423" CREATED="1556788222923" MODIFIED="1556807034461" HGAP_QUANTITY="97.99999749660498 pt" VSHIFT_QUANTITY="-18.749999441206466 pt">
<edge COLOR="#00ff00"/>
<node TEXT="https://github.com/avescodes/conformity" ID="ID_1122121838" CREATED="1556789082431" MODIFIED="1556790410192"/>
<node TEXT="best practices on website" ID="ID_1835794524" CREATED="1556790415454" MODIFIED="1556790422277"/>
</node>
<node TEXT="replication" POSITION="left" ID="ID_1174087162" CREATED="1556788229437" MODIFIED="1556807623879" HGAP_QUANTITY="116.74999693781146 pt" VSHIFT_QUANTITY="29.2499991282821 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="through db replication" ID="ID_260710872" CREATED="1556789091181" MODIFIED="1556790385970"/>
</node>
<node TEXT="schema-on-read" POSITION="right" ID="ID_1269716269" CREATED="1556788501999" MODIFIED="1556790254816" HGAP_QUANTITY="33.499999418854735 pt" VSHIFT_QUANTITY="-24.74999926239254 pt">
<edge COLOR="#007c00"/>
<node TEXT="create default schema for new attributes" ID="ID_999280145" CREATED="1556789207975" MODIFIED="1556790020188"/>
<node TEXT="should explicitly specified on db creation" ID="ID_1056178233" CREATED="1556790590520" MODIFIED="1556790606314"/>
</node>
<node TEXT="storage location" POSITION="right" ID="ID_918329231" CREATED="1556788513000" MODIFIED="1556808030056" HGAP_QUANTITY="30.49999950826169 pt" VSHIFT_QUANTITY="17.249999485909953 pt">
<edge COLOR="#7c007c"/>
<node TEXT="in db" ID="ID_869514719" CREATED="1556789381856" MODIFIED="1556808030054" HGAP_QUANTITY="28.99999955296518 pt" VSHIFT_QUANTITY="1.4999999552965178 pt"/>
</node>
<node TEXT="creation" POSITION="right" ID="ID_1944383658" CREATED="1556789400340" MODIFIED="1556790323091" HGAP_QUANTITY="31.999999463558208 pt" VSHIFT_QUANTITY="57.74999827891594 pt">
<edge COLOR="#007c7c"/>
<node TEXT="insert via transact" ID="ID_1423307844" CREATED="1556789417354" MODIFIED="1556789442270"/>
<node TEXT="check for reserved :db/* attributes" ID="ID_741777335" CREATED="1556789443993" MODIFIED="1556790042344"/>
<node TEXT="possible to read edn on db creation" FOLDED="true" ID="ID_1507933143" CREATED="1556790049825" MODIFIED="1556790267939">
<node TEXT="add literal for id creation" ID="ID_663503788" CREATED="1556790072289" MODIFIED="1556790267939" HGAP_QUANTITY="28.24999957531692 pt" VSHIFT_QUANTITY="29.999999105930357 pt"/>
</node>
</node>
<node TEXT="attributes: db/*" POSITION="left" ID="ID_1677623709" CREATED="1556789792650" MODIFIED="1556807621410" HGAP_QUANTITY="69.49999834597115 pt" VSHIFT_QUANTITY="56.24999832361941 pt">
<edge COLOR="#7c7c00"/>
<node TEXT="ident" ID="ID_1796923884" CREATED="1556789820766" MODIFIED="1556789831816"/>
<node TEXT="id" ID="ID_451549815" CREATED="1556789845793" MODIFIED="1556789848878"/>
<node TEXT="valueType" ID="ID_36724509" CREATED="1556789850296" MODIFIED="1556789853634"/>
<node TEXT="cardinality" ID="ID_513853698" CREATED="1556789854175" MODIFIED="1556789903485" VSHIFT_QUANTITY="3.7499998882412946 pt"/>
<node TEXT="index" ID="ID_317162768" CREATED="1556789857736" MODIFIED="1556789860365"/>
<node TEXT="unique" ID="ID_1210256758" CREATED="1556789865172" MODIFIED="1556789867835"/>
<node TEXT="isComponent" ID="ID_1507896972" CREATED="1556789876881" MODIFIED="1556789879154">
<node TEXT="http://blog.datomic.com/2013/06/component-entities.html" ID="ID_1902158210" CREATED="1556790922188" MODIFIED="1556790923950"/>
</node>
<node TEXT="additional functionality?" ID="ID_1514342242" CREATED="1556788655586" MODIFIED="1556807599518" HGAP_QUANTITY="24.499999687075622 pt" VSHIFT_QUANTITY="26.24999921768906 pt">
<node TEXT="full-text" ID="ID_213220545" CREATED="1556788757598" MODIFIED="1556788760375"/>
<node TEXT="invariants" ID="ID_755135841" CREATED="1556788766751" MODIFIED="1556788769908"/>
<node TEXT="triggers" ID="ID_273996562" CREATED="1556791272681" MODIFIED="1556791275264"/>
<node TEXT="database links" ID="ID_740073088" CREATED="1556791523260" MODIFIED="1556791528045"/>
</node>
</node>
<node TEXT="error handling" POSITION="right" ID="ID_1901884503" CREATED="1556807922156" MODIFIED="1556807930179" HGAP_QUANTITY="19.999999821186073 pt" VSHIFT_QUANTITY="35.249998949468164 pt">
<edge COLOR="#00ffff"/>
</node>
</node>
</map>
