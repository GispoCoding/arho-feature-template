<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.40.9-Bratislava" labelsEnabled="1" styleCategories="Symbology|Labeling">
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{ec7a971d-4beb-4c60-9d02-5ffeea589393}">
      <rule label="Rakennetun kulttuuriympäristön ja maiseman vaalimisen kannalta tärkeä alue" symbol="0" key="{25d9a52c-db60-4d5d-8781-88f79d6c3fb9}" filter="array_sort( map_akeys(&quot;type_regulations&quot; ))= array('maisemallisestiArvokasAlue', 'merkittavaRakennettuKulttuuriymparisto')"/>
      <rule label="Merkittävä rakennettu &#xa;kulttuuriympäristö " symbol="1" key="{1c827bef-f20c-495d-b800-a640270050f0}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xa;  'osaAlue'&#xa;)&#xd;&#xa;AND NOT map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'kansainvalinen'&#xd;&#xa;)&#xd;&#xa;AND NOT map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'maakunnallinen'&#xd;&#xa;)"/>
      <rule label="Kansainvälisesti merkittävä rakennettu kulttuuriympäristö" symbol="2" key="{960a27df-8044-4dac-9c9a-f2faecccc028}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'kansainvalinen'&#xd;&#xa;)&#xa;AND&#xa;map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö" symbol="3" key="{5bc2d036-9d36-4d19-aa03-4761db742006}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)"/>
      <rule label="Maakunnallisesti merkittävä rakennettu kulttuuriympäristö" symbol="4" key="{d9acfcbc-73ce-4f17-b307-a3336f1e82dd}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'maakunnallinen'&#xd;&#xa;)&#xa;AND&#xa;map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Kaupunki- tai kyläkuvallisesti arvokas alue" symbol="5" key="{02e23537-9591-4cb9-bb26-623d9ea7aa89}" filter="map_exist(&#xa;    map_get(&quot;type_regulations&quot;, 'kaupunkiTaiKylakuvallisestiArvokasAlue'),&#xa;    'osaAlue'&#xa;)"/>
      <rule label="Muu arkeologinen kohde, joka ei ole muinaismuistolain nojalla rauhoitettu kiinteä muinaisjäännös" symbol="6" key="{3f0d62dd-5d9a-4d0b-8cde-58972a6adbea}" filter="map_exist(&#xa;    map_get(&quot;type_regulations&quot;, 'muuArkeologinenKohde'),&#xa;    'osaAlue'&#xa;)"/>
      <rule label="Valtakunnallisesti merkittävä arkeologinen kohde" symbol="7" key="{ebd91789-5574-44ee-b803-ecf857aa82d4}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'valtakunnallisestiMerkittavaArkeologinenKohde'),&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)&#xa;AND&#xa;map_exist(&#xa;    map_get(&quot;type_regulations&quot;, 'valtakunnallisestiMerkittavaArkeologinenKohde'),&#xa;    'osaAlue'&#xa;)&#xa;"/>
      <rule label="Arvokas harjualue tai muu geologinen muodostuma" symbol="8" key="{68014eaf-458a-44eb-97f4-b9c27ac78d4c}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'arvokasGeologinenMuodostuma'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Tärkeä vedenhankintaan soveltuva pohjavesialue" symbol="9" key="{f7556d4c-d492-44cb-89f4-851d01a88fe8}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'pohjavesialue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Natura 2000 -verkostoon kuuluva alue" symbol="10" key="{20be715f-b950-4f9b-9553-0f080dac04f5}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'natura2000VerkostonAlue'),&#xd;&#xa;  'osaAlue'&#xd;&#xa;)"/>
      <rule label="Luonnon monimuotoisuuden kannalta erityisen tärkeä alue" symbol="11" key="{1a48b008-5005-4561-b68d-503a1d20286e}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Luonnon rauhan kannalta tärkeä alue" symbol="12" key="{c4c63d8c-b1b2-46e6-b007-43430abc3e55}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'luonnonRauhanKannaltaTarkeaAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="UNESCO:n maailmanperintökohde" symbol="13" key="{c55b84cc-b69f-41ff-b840-53cf73640bab}" filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'unesconMaailmanperintokohde'),&#xd;&#xa;  'osaAlue'&#xd;&#xa;)"/>
      <rule label="Luonnon rauhan kannalta tärkeä alue" symbol="14" key="{6c5b1d7d-22b0-47ed-88bf-8f5eed818c97}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'kansallinenKaupunkipuisto'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Saamelaiskulttuurin kannalta tärkeä alue" symbol="15" key="{e94bc7bc-176e-44be-9b6a-d61e33d3a4f3}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'saamelaiskulttuurinKannaltaTarkeaAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Ympäristöhäiriöalue" symbol="16" key="{ead180d7-fbaf-4316-969a-6b58706c1f0f}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'ymparistohairioalue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Vaara-alue" symbol="17" key="{0102b51d-e623-4674-820e-398c73eb033d}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'vaaraAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Tulvariskialue" symbol="18" key="{7a622cd0-47ce-4e6b-af99-1b25cb539231}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'tulvariskialue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Alue, jota koskee rakentamisrajoitus" symbol="19" key="{1f461bb9-5956-4205-a938-72183ad93f90}" filter="array_sort(map_akeys(&quot;regulation_values&quot;)) = array('rakentamisrajoitusMaakuntakaava')&#xd;&#xa;"/>
      <rule label="Alue, jota koskee määäaikainenrakentamisrajoitus" symbol="20" key="{0aa827c7-fc42-4e72-be6d-0f1cb9a3356f}" filter="array_sort(map_akeys(&quot;regulation_values&quot;)) = array('maaraAikainenRakentamisrajoitus')&#xd;&#xa;"/>
      <rule label="Tuulivoimaloiden alue" symbol="21" key="{11d70cb6-3079-4fd7-b70e-ae6ab30d1524}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'tuulivoimalaAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule label="Aurinkovoimaloiden alue" symbol="22" key="{b95fb3b7-f72f-40ea-9dc2-7ab2f1093f70}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'aurinkovoimalaAlue'),&#xa;  'osaAlue'&#xa;)"/>
      <rule symbol="23" key="{b764f580-9922-4bf7-95e4-69c9259b64b8}" filter="ELSE"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" is_animated="0" name="0" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0.6" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="EllipseMarker" pass="0" id="{33c7a4d6-4b67-4727-8907-31c14803ff49}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,255,0,rgb:0,0,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="153,214,209,255,rgb:0.59999999999999998,0.83921568627450982,0.81960784313725488,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.6" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="size" value="3" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="3" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="3" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0b8ac9ff-14a2-4b46-8a74-8d51f3f43780}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,255,0,rgb:0,0,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="153,214,209,255,rgb:0.59999999999999998,0.83921568627450982,0.81960784313725488,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.6" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="size" value="6" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="6" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="6" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="1" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="10" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="150,150,150,255,rgb:0.58823529411764708,0.58823529411764708,0.58823529411764708,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="7" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="11" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="12" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="13" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="7" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="14" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,109,0,255,rgb:0,0.42745098039215684,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,109,0,255,rgb:0,0.42745098039215684,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="15" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="188,165,208,255,rgb:0.73725490196078436,0.6470588235294118,0.81568627450980391,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="188,165,208,255,rgb:0.73725490196078436,0.6470588235294118,0.81568627450980391,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="16" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="SvgMarker" pass="0" id="{f5ad7319-52f3-4f1d-8930-7fc6f7d7ea00}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="fixedAspectRatio" value="2.33333" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="name" value="/home/mika/Downloads/exclamation_mark.svg" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_width" value="0.2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="parameters"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="3" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="EllipseMarker" pass="0" id="{274911ca-153a-44af-87b1-9f6eca07a740}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,0,rgb:1,0,0,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="205,23,25,255,rgb:0.80392156862745101,0.09019607843137255,0.09803921568627451,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="12" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="Point" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="12" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="17" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="SvgMarker" pass="0" id="{f5ad7319-52f3-4f1d-8930-7fc6f7d7ea00}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="fixedAspectRatio" value="2.33333" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="name" value="/home/mika/Downloads/exclamation_mark.svg" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_width" value="0.2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="parameters"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="3" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="EllipseMarker" pass="0" id="{274911ca-153a-44af-87b1-9f6eca07a740}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,0,rgb:1,0,0,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="205,23,25,255,rgb:0.80392156862745101,0.09019607843137255,0.09803921568627451,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="12" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="Point" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="12" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="18" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="SvgMarker" pass="0" id="{f5ad7319-52f3-4f1d-8930-7fc6f7d7ea00}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="fixedAspectRatio" value="2.33333" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="name" value="/home/mika/Downloads/exclamation_mark.svg" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_width" value="0.2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="parameters"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="3" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="EllipseMarker" pass="0" id="{274911ca-153a-44af-87b1-9f6eca07a740}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,0,rgb:1,0,0,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="205,23,25,255,rgb:0.80392156862745101,0.09019607843137255,0.09803921568627451,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="12" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="Point" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="12" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="19" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{f6fd0360-6b1f-4d87-9681-38bfc7fc5759}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,0,rgb:0,0,0,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="12" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="Point" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="12" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{7d729d3f-6674-425b-a7f8-88624e014e6b}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="45" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255,rgb:1,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="line" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.5" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{a32b6775-260b-4b07-b208-a97f43705dec}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="-45" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255,rgb:1,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="line" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.5" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="2" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="4" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="6" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="20" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{f6fd0360-6b1f-4d87-9681-38bfc7fc5759}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,0,rgb:0,0,0,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="12" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="Point" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="12" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{7d729d3f-6674-425b-a7f8-88624e014e6b}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="45" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255,rgb:1,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="line" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.5" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{a32b6775-260b-4b07-b208-a97f43705dec}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="-45" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255,rgb:1,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="line" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.5" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="12" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="21" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="22" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="0,0,0,255,rgb:0,0,0,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="23" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="SimpleMarker" pass="0" id="{89233654-b889-4645-8f69-ca31abb0e128}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="145,82,45,0,rgb:0.56862745098039214,0.32156862745098042,0.17647058823529413,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="hexagon" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="238,17,46,255,rgb:0.93333333333333335,0.06666666666666667,0.1803921568627451,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="6" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="3" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="8" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="4" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.75" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="10" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="5" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="188,167,209,255,rgb:0.73725490196078436,0.65490196078431373,0.81960784313725488,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="6" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="240,130,19,255,rgb:0.94117647058823528,0.50980392156862742,0.07450980392156863,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="7" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="240,130,19,255,rgb:0.94117647058823528,0.50980392156862742,0.07450980392156863,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" class="SimpleMarker" pass="0" id="{74edad02-21da-409c-8c7c-a034db4750e7}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="240,130,19,255,rgb:0.94117647058823528,0.50980392156862742,0.07450980392156863,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="8" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="Point" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="8" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="110,110,110,255,rgb:0.43137254901960786,0.43137254901960786,0.43137254901960786,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" name="9" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="EllipseMarker" pass="0" id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,62,190,255,rgb:0,0.24313725490196078,0.74509803921568629,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="miter" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="1" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="Point" type="QString"/>
            <Option name="size" value="4.5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="symbol_height" value="4.5" type="QString"/>
            <Option name="symbol_height_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_height_unit" value="MM" type="QString"/>
            <Option name="symbol_name" value="circle" type="QString"/>
            <Option name="symbol_width" value="4.5" type="QString"/>
            <Option name="symbol_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="symbol_width_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol clip_to_extent="1" is_animated="0" name="" frame_rate="10" alpha="1" type="marker" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" class="SimpleMarker" pass="0" id="{dad1e4ac-0522-4f65-80ef-54dabf9cc2bc}" enabled="1">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255,rgb:1,0,0,1" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="2" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <labeling type="rule-based">
    <rules key="{2703742b-d70b-4f47-a77c-77c6f49c2229}">
      <rule description="Font size 11" key="{e19df201-a324-48f7-a980-b83fddbf7932}" filter="array_sort(map_akeys(&quot;regulation_values&quot;)) = array('rakentamisrajoitusMaakuntakaava')">
        <settings calloutType="simple">
          <text-style fontFamily="Open Sans" isExpression="1" fontItalic="0" fontUnderline="0" namedStyle="Bold" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" fontSizeUnit="Point" fontStrikeout="0" multilineHeight="1" forcedBold="0" capitalization="0" useSubstitutions="0" forcedItalic="0" multilineHeightUnit="Percentage" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontLetterSpacing="0" fontWeight="75" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" allowHtml="0" fontWordSpacing="0" blendMode="0" textOpacity="1" textOrientation="horizontal" tabStopDistanceUnit="Point" fontKerning="1" fontSize="11">
            <families/>
            <text-buffer bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferJoinStyle="128" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM"/>
            <text-mask maskedSymbolLayers="" maskEnabled="0" maskJoinStyle="128" maskType="0" maskOpacity="1" maskSizeUnits="MM" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeSizeX="0" shapeType="0" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeOpacity="1" shapeBlendMode="0" shapeOffsetX="0" shapeBorderWidth="0" shapeSVGFile="" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeBorderWidthUnit="Point" shapeSizeY="0" shapeRadiiUnit="Point" shapeSizeUnit="Point" shapeRotation="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" is_animated="0" name="markerSymbol" frame_rate="10" alpha="1" type="marker" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleMarker" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="angle" value="0" type="QString"/>
                    <Option name="cap_style" value="square" type="QString"/>
                    <Option name="color" value="255,158,23,255,rgb:1,0.61960784313725492,0.09019607843137255,1" type="QString"/>
                    <Option name="horizontal_anchor_point" value="1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="name" value="circle" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
                    <Option name="outline_style" value="solid" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="outline_width_unit" value="MM" type="QString"/>
                    <Option name="scale_method" value="diameter" type="QString"/>
                    <Option name="size" value="2" type="QString"/>
                    <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="size_unit" value="MM" type="QString"/>
                    <Option name="vertical_anchor_point" value="1" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol clip_to_extent="1" is_animated="0" name="fillSymbol" frame_rate="10" alpha="1" type="fill" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleFill" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" type="QString"/>
                    <Option name="outline_style" value="no" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_unit" value="Point" type="QString"/>
                    <Option name="style" value="solid" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetDist="1" shadowUnder="0" shadowOffsetAngle="135" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" multilineAlign="3" addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" plussign="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" autoWrapLength="0" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
          <placement preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="1" allowDegraded="0" placementFlags="10" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" rotationUnit="AngleDegrees" offsetUnits="Point" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" yOffset="-5" maxCurvedCharAngleIn="25" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" maximumDistance="0" prioritization="PreferCloser" repeatDistanceUnits="MM" rotationAngle="0" geometryGeneratorEnabled="0" placement="1" lineAnchorClipping="0" layerType="PointGeometry" centroidInside="0" overrunDistanceUnit="MM" lineAnchorType="0" centroidWhole="0" fitInPolygonOnly="0" repeatDistance="0" polygonPlacementFlags="2" lineAnchorPercent="0.5" maxCurvedCharAngleOut="-25" overlapHandling="PreventOverlap" quadOffset="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" xOffset="0" geometryGenerator="" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" dist="0" maximumDistanceUnit="MM"/>
          <rendering maxNumLabels="2000" limitNumLabels="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" labelPerPart="0" mergeLines="0" fontMaxPixelSize="10000" obstacleType="1" drawLabels="1" unplacedVisibility="0" scaleMax="0" zIndex="0" obstacle="1" upsidedownLabels="0" scaleMin="0" fontLimitPixelSize="0" minFeatureSize="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="blendMode" value="0" type="int"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer locked=&quot;0&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot; id=&quot;{fc5a1575-59b9-4b23-ae4d-8e9e28d2962f}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule description="Font size 13" key="{c15ed9ad-60b5-49fc-8b6d-fba5bb9b9a5a}" filter="array_sort(map_akeys(&quot;regulation_values&quot;)) = array('maaraAikainenRakentamisrajoitus')">
        <settings calloutType="simple">
          <text-style fontFamily="Open Sans" isExpression="1" fontItalic="0" fontUnderline="0" namedStyle="Bold" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" fontSizeUnit="Point" fontStrikeout="0" multilineHeight="1" forcedBold="0" capitalization="0" useSubstitutions="0" forcedItalic="0" multilineHeightUnit="Percentage" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontLetterSpacing="0" fontWeight="75" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" allowHtml="0" fontWordSpacing="0" blendMode="0" textOpacity="1" textOrientation="horizontal" tabStopDistanceUnit="Point" fontKerning="1" fontSize="13">
            <families/>
            <text-buffer bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferJoinStyle="128" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM"/>
            <text-mask maskedSymbolLayers="" maskEnabled="0" maskJoinStyle="128" maskType="0" maskOpacity="1" maskSizeUnits="MM" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeSizeX="0" shapeType="0" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeOpacity="1" shapeBlendMode="0" shapeOffsetX="0" shapeBorderWidth="0" shapeSVGFile="" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeBorderWidthUnit="Point" shapeSizeY="0" shapeRadiiUnit="Point" shapeSizeUnit="Point" shapeRotation="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" is_animated="0" name="markerSymbol" frame_rate="10" alpha="1" type="marker" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleMarker" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="angle" value="0" type="QString"/>
                    <Option name="cap_style" value="square" type="QString"/>
                    <Option name="color" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" type="QString"/>
                    <Option name="horizontal_anchor_point" value="1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="name" value="circle" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
                    <Option name="outline_style" value="solid" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="outline_width_unit" value="MM" type="QString"/>
                    <Option name="scale_method" value="diameter" type="QString"/>
                    <Option name="size" value="2" type="QString"/>
                    <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="size_unit" value="MM" type="QString"/>
                    <Option name="vertical_anchor_point" value="1" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol clip_to_extent="1" is_animated="0" name="fillSymbol" frame_rate="10" alpha="1" type="fill" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleFill" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" type="QString"/>
                    <Option name="outline_style" value="no" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_unit" value="Point" type="QString"/>
                    <Option name="style" value="solid" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetDist="1" shadowUnder="0" shadowOffsetAngle="135" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" multilineAlign="3" addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" plussign="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" autoWrapLength="0" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
          <placement preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="1" allowDegraded="0" placementFlags="10" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" rotationUnit="AngleDegrees" offsetUnits="Point" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" yOffset="-5" maxCurvedCharAngleIn="25" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" maximumDistance="0" prioritization="PreferCloser" repeatDistanceUnits="MM" rotationAngle="0" geometryGeneratorEnabled="0" placement="1" lineAnchorClipping="0" layerType="PointGeometry" centroidInside="0" overrunDistanceUnit="MM" lineAnchorType="0" centroidWhole="0" fitInPolygonOnly="0" repeatDistance="0" polygonPlacementFlags="2" lineAnchorPercent="0.5" maxCurvedCharAngleOut="-25" overlapHandling="PreventOverlap" quadOffset="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" xOffset="0" geometryGenerator="" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" dist="0" maximumDistanceUnit="MM"/>
          <rendering maxNumLabels="2000" limitNumLabels="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" labelPerPart="0" mergeLines="0" fontMaxPixelSize="10000" obstacleType="1" drawLabels="1" unplacedVisibility="0" scaleMax="0" zIndex="0" obstacle="1" upsidedownLabels="0" scaleMin="0" fontLimitPixelSize="0" minFeatureSize="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="blendMode" value="0" type="int"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer locked=&quot;0&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot; id=&quot;{296cf969-cff3-4a58-9175-29eedb3e7b80}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule description="Font size 16" key="{fa95bfb4-efe2-4c4c-820a-127e52d79d7e}" filter="map_exist(&#xa;  map_get(&quot;type_regulations&quot;, 'tuulivoimalaAlue'),&#xa;  'osaAlue'&#xa;)">
        <settings calloutType="simple">
          <text-style fontFamily="Open Sans" isExpression="1" fontItalic="0" fontUnderline="0" namedStyle="Bold" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" fontSizeUnit="Point" fontStrikeout="0" multilineHeight="1" forcedBold="0" capitalization="0" useSubstitutions="0" forcedItalic="0" multilineHeightUnit="Percentage" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontLetterSpacing="0" fontWeight="75" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" allowHtml="0" fontWordSpacing="0" blendMode="0" textOpacity="1" textOrientation="horizontal" tabStopDistanceUnit="Point" fontKerning="1" fontSize="16">
            <families/>
            <text-buffer bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferJoinStyle="128" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM"/>
            <text-mask maskedSymbolLayers="" maskEnabled="0" maskJoinStyle="128" maskType="0" maskOpacity="1" maskSizeUnits="MM" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeSizeX="0" shapeType="0" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeOpacity="1" shapeBlendMode="0" shapeOffsetX="0" shapeBorderWidth="0" shapeSVGFile="" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeBorderWidthUnit="Point" shapeSizeY="0" shapeRadiiUnit="Point" shapeSizeUnit="Point" shapeRotation="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" is_animated="0" name="markerSymbol" frame_rate="10" alpha="1" type="marker" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleMarker" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="angle" value="0" type="QString"/>
                    <Option name="cap_style" value="square" type="QString"/>
                    <Option name="color" value="141,90,153,255,rgb:0.55294117647058827,0.35294117647058826,0.59999999999999998,1" type="QString"/>
                    <Option name="horizontal_anchor_point" value="1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="name" value="circle" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
                    <Option name="outline_style" value="solid" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="outline_width_unit" value="MM" type="QString"/>
                    <Option name="scale_method" value="diameter" type="QString"/>
                    <Option name="size" value="2" type="QString"/>
                    <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="size_unit" value="MM" type="QString"/>
                    <Option name="vertical_anchor_point" value="1" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol clip_to_extent="1" is_animated="0" name="fillSymbol" frame_rate="10" alpha="1" type="fill" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleFill" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" type="QString"/>
                    <Option name="outline_style" value="no" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_unit" value="Point" type="QString"/>
                    <Option name="style" value="solid" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetDist="1" shadowUnder="0" shadowOffsetAngle="135" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" multilineAlign="3" addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" plussign="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" autoWrapLength="0" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
          <placement preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="1" allowDegraded="0" placementFlags="10" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" rotationUnit="AngleDegrees" offsetUnits="MM" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" yOffset="-2" maxCurvedCharAngleIn="25" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" maximumDistance="0" prioritization="PreferCloser" repeatDistanceUnits="MM" rotationAngle="0" geometryGeneratorEnabled="0" placement="1" lineAnchorClipping="0" layerType="PointGeometry" centroidInside="0" overrunDistanceUnit="MM" lineAnchorType="0" centroidWhole="0" fitInPolygonOnly="0" repeatDistance="0" polygonPlacementFlags="2" lineAnchorPercent="0.5" maxCurvedCharAngleOut="-25" overlapHandling="PreventOverlap" quadOffset="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" xOffset="0" geometryGenerator="" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" dist="0" maximumDistanceUnit="MM"/>
          <rendering maxNumLabels="2000" limitNumLabels="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" labelPerPart="0" mergeLines="0" fontMaxPixelSize="10000" obstacleType="1" drawLabels="1" unplacedVisibility="0" scaleMax="0" zIndex="0" obstacle="1" upsidedownLabels="0" scaleMin="0" fontLimitPixelSize="0" minFeatureSize="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="blendMode" value="0" type="int"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer locked=&quot;0&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot; id=&quot;{2836e32e-7cc4-454d-a4b1-bb6ccbf9039d}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule description="Font size 10" key="{38bd7724-e385-48ab-8988-849c591225f8}" filter="ELSE">
        <settings calloutType="simple">
          <text-style fontFamily="Open Sans" isExpression="1" fontItalic="0" fontUnderline="0" namedStyle="Bold" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" fontSizeUnit="Point" fontStrikeout="0" multilineHeight="1" forcedBold="0" capitalization="0" useSubstitutions="0" forcedItalic="0" multilineHeightUnit="Percentage" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontLetterSpacing="0" fontWeight="75" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" allowHtml="0" fontWordSpacing="0" blendMode="0" textOpacity="1" textOrientation="horizontal" tabStopDistanceUnit="Point" fontKerning="1" fontSize="10">
            <families/>
            <text-buffer bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferJoinStyle="128" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM"/>
            <text-mask maskedSymbolLayers="" maskEnabled="0" maskJoinStyle="128" maskType="0" maskOpacity="1" maskSizeUnits="MM" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeSizeX="0" shapeType="0" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeOpacity="1" shapeBlendMode="0" shapeOffsetX="0" shapeBorderWidth="0" shapeSVGFile="" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeBorderWidthUnit="Point" shapeSizeY="0" shapeRadiiUnit="Point" shapeSizeUnit="Point" shapeRotation="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" is_animated="0" name="markerSymbol" frame_rate="10" alpha="1" type="marker" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleMarker" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="angle" value="0" type="QString"/>
                    <Option name="cap_style" value="square" type="QString"/>
                    <Option name="color" value="190,178,151,255,rgb:0.74509803921568629,0.69803921568627447,0.59215686274509804,1" type="QString"/>
                    <Option name="horizontal_anchor_point" value="1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="name" value="circle" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString"/>
                    <Option name="outline_style" value="solid" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="outline_width_unit" value="MM" type="QString"/>
                    <Option name="scale_method" value="diameter" type="QString"/>
                    <Option name="size" value="2" type="QString"/>
                    <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="size_unit" value="MM" type="QString"/>
                    <Option name="vertical_anchor_point" value="1" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol clip_to_extent="1" is_animated="0" name="fillSymbol" frame_rate="10" alpha="1" type="fill" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" class="SimpleFill" pass="0" id="" enabled="1">
                  <Option type="Map">
                    <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" type="QString"/>
                    <Option name="outline_style" value="no" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_unit" value="Point" type="QString"/>
                    <Option name="style" value="solid" type="QString"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetDist="1" shadowUnder="0" shadowOffsetAngle="135" shadowScale="100" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" multilineAlign="3" addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" plussign="0" useMaxLineLengthForAutoWrap="1" formatNumbers="0" autoWrapLength="0" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
          <placement preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" offsetType="1" allowDegraded="0" placementFlags="10" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" rotationUnit="AngleDegrees" offsetUnits="Point" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" yOffset="-7" maxCurvedCharAngleIn="25" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" maximumDistance="0" prioritization="PreferCloser" repeatDistanceUnits="MM" rotationAngle="0" geometryGeneratorEnabled="0" placement="1" lineAnchorClipping="0" layerType="PointGeometry" centroidInside="0" overrunDistanceUnit="MM" lineAnchorType="0" centroidWhole="0" fitInPolygonOnly="0" repeatDistance="0" polygonPlacementFlags="2" lineAnchorPercent="0.5" maxCurvedCharAngleOut="-25" overlapHandling="PreventOverlap" quadOffset="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" xOffset="0" geometryGenerator="" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" dist="0" maximumDistanceUnit="MM"/>
          <rendering maxNumLabels="2000" limitNumLabels="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" labelPerPart="0" mergeLines="0" fontMaxPixelSize="10000" obstacleType="1" drawLabels="1" unplacedVisibility="0" scaleMax="0" zIndex="0" obstacle="1" upsidedownLabels="0" scaleMin="0" fontLimitPixelSize="0" minFeatureSize="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="blendMode" value="0" type="int"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer locked=&quot;0&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot; id=&quot;{2401d2c3-8d23-4035-b250-9bdd9a77b5fa}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>0</layerGeometryType>
</qgis>
