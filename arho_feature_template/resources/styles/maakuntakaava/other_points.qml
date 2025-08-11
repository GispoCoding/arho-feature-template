<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.40.4-Bratislava" styleCategories="Symbology|Labeling" labelsEnabled="1">
  <renderer-v2 type="RuleRenderer" referencescale="-1" symbollevels="0" forceraster="0" enableorderby="0">
    <rules key="{ec7a971d-4beb-4c60-9d02-5ffeea589393}">
      <rule filter="array_sort( map_akeys(&quot;type_regulations&quot; ))= array('maisemallisestiArvokasAlue', 'merkittavaRakennettuKulttuuriymparisto')" key="{25d9a52c-db60-4d5d-8781-88f79d6c3fb9}" symbol="0" label="Rakennetun kulttuuriympäristön ja maiseman vaalimisen kannalta tärkeä alue"/>
      <rule filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('merkittavaRakennettuKulttuuriymparisto')&#xd;&#xa;AND NOT map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'kansainvalinen'&#xd;&#xa;)&#xd;&#xa;AND NOT map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'maakunnallinen'&#xd;&#xa;)" key="{1c827bef-f20c-495d-b800-a640270050f0}" symbol="1" label="Merkittävä rakennettu &#xa;kulttuuriympäristö "/>
      <rule filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'kansainvalinen'&#xd;&#xa;)" key="{960a27df-8044-4dac-9c9a-f2faecccc028}" symbol="2" label="Kansainvälisesti merkittävä rakennettu kulttuuriympäristö"/>
      <rule filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)" key="{5bc2d036-9d36-4d19-aa03-4761db742006}" symbol="3" label="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö"/>
      <rule filter="map_exist(&#xd;&#xa;  map_get(&quot;type_regulations&quot;, 'merkittavaRakennettuKulttuuriymparisto'),&#xd;&#xa;  'maakunnallinen'&#xd;&#xa;)" key="{d9acfcbc-73ce-4f17-b307-a3336f1e82dd}" symbol="4" label="Maakunnallisesti merkittävä rakennettu kulttuuriympäristö"/>
      <rule filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('kaupunkiTaiKylakuvallisestiArvokasAlue')&#xd;&#xa;" key="{02e23537-9591-4cb9-bb26-623d9ea7aa89}" symbol="5" label="Kaupunki- tai kyläkuvallisesti arvokas alue"/>
      <rule filter="ELSE" key="{f4f2ab5f-fe7e-404a-af00-bd46bb618da9}" symbol="6"/>
      <rule filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('muuArkeologinenKohde')&#xd;&#xa;" key="{3f0d62dd-5d9a-4d0b-8cde-58972a6adbea}" symbol="7" label="Muu arkeologinen kohde, joka ei ole muinaismuistolain nojalla rauhoitettu kiinteä muinaisjäännös"/>
    </rules>
    <symbols>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0.6" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer id="{33c7a4d6-4b67-4727-8907-31c14803ff49}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="0,0,255,0,rgb:0,0,1,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="153,214,209,255,rgb:0.59999999999999998,0.83921568627450982,0.81960784313725488,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.6" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="3" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="3" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="3" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer id="{0b8ac9ff-14a2-4b46-8a74-8d51f3f43780}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="0,0,255,0,rgb:0,0,1,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="153,214,209,255,rgb:0.59999999999999998,0.83921568627450982,0.81960784313725488,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.6" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="6" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="6" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="6" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="1" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="2" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="4" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer id="{74edad02-21da-409c-8c7c-a034db4750e7}" pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="6" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="Point" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="3" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="2" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer id="{74edad02-21da-409c-8c7c-a034db4750e7}" pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="8" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="Point" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="4" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{bcf38bde-97da-4931-b0e5-12c23f23cc42}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,0,rgb:0.45098039215686275,0.69803921568627447,1,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.75" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer id="{74edad02-21da-409c-8c7c-a034db4750e7}" pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="115,178,255,255,rgb:0.45098039215686275,0.69803921568627447,1,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="10" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="Point" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="5" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="188,167,209,255,rgb:0.73725490196078436,0.65490196078431373,0.81960784313725488,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="6" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{89233654-b889-4645-8f69-ca31abb0e128}" pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="145,82,45,0,rgb:0.56862745098039214,0.32156862745098042,0.17647058823529413,0" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="hexagon" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="238,17,46,255,rgb:0.93333333333333335,0.06666666666666667,0.1803921568627451,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="6" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="7" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{0f6c0f55-ab75-442d-81c9-efed83be090c}" pass="0" class="EllipseMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="240,130,19,255,rgb:0.94117647058823528,0.50980392156862742,0.07450980392156863,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="miter" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,31,32,255,rgb:0.13725490196078433,0.12156862745098039,0.12549019607843137,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="Point" name="outline_width_unit"/>
            <Option type="QString" value="4.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="4.5" name="symbol_height"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_height_unit"/>
            <Option type="QString" value="circle" name="symbol_name"/>
            <Option type="QString" value="4.5" name="symbol_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="symbol_width_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{dad1e4ac-0522-4f65-80ef-54dabf9cc2bc}" pass="0" class="SimpleMarker" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style textOpacity="1" fontLetterSpacing="0" fontStrikeout="0" namedStyle="Regular" legendString="Aa" useSubstitutions="0" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" fontSizeUnit="Point" fontUnderline="0" isExpression="1" allowHtml="0" fontWordSpacing="0" fontKerning="1" multilineHeightUnit="Percentage" fontFamily="Open Sans" tabStopDistance="80" blendMode="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" multilineHeight="1" fontSize="8" tabStopDistanceUnit="Point" fieldName="array_to_string(&quot;short_names&quot;, '/')" forcedItalic="0" textOrientation="horizontal" capitalization="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" forcedBold="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontWeight="50">
        <families/>
        <text-buffer bufferSizeUnits="MM" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferNoFill="1" bufferOpacity="1" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferBlendMode="0" bufferDraw="0" bufferSize="1"/>
        <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128" maskedSymbolLayers="" maskSize="1.5" maskOpacity="1" maskType="0" maskSizeUnits="MM" maskEnabled="0"/>
        <background shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeSizeY="0" shapeRadiiX="0" shapeSizeUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeRotation="0" shapeRotationType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="Point" shapeJoinStyle="64" shapeOffsetX="0" shapeSizeX="0" shapeType="0" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeOffsetY="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeRadiiY="0" shapeOffsetUnit="Point" shapeSVGFile="" shapeBlendMode="0" shapeSizeType="0">
          <symbol type="marker" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="markerSymbol" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer id="" pass="0" class="SimpleMarker" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="190,178,151,255,rgb:0.74509803921568629,0.69803921568627447,0.59215686274509804,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="2" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol type="fill" clip_to_extent="1" alpha="1" force_rhr="0" is_animated="0" name="fillSymbol" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer id="" pass="0" class="SimpleFill" enabled="1" locked="0">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowBlendMode="6" shadowScale="100" shadowDraw="0" shadowRadiusUnit="MM" shadowOffsetGlobal="1" shadowOffsetAngle="135" shadowRadius="1.5" shadowOffsetUnit="MM" shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format addDirectionSymbol="0" formatNumbers="0" multilineAlign="3" reverseDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" plussign="0" rightDirectionSymbol=">" autoWrapLength="0" placeDirectionSymbol="0" decimals="3" leftDirectionSymbol="&lt;" wrapChar=""/>
      <placement yOffset="-1.5" repeatDistance="0" prioritization="PreferCloser" polygonPlacementFlags="2" geometryGenerator="" lineAnchorClipping="0" placement="1" maxCurvedCharAngleOut="-25" lineAnchorTextPoint="FollowPlacement" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceUnit="MM" offsetType="1" preserveRotation="1" priority="5" maximumDistance="0" overlapHandling="PreventOverlap" distUnits="MM" dist="0" centroidInside="0" centroidWhole="0" layerType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maximumDistanceUnit="MM" placementFlags="10" offsetUnits="MM" geometryGeneratorType="PointGeometry" xOffset="0" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" rotationAngle="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" fitInPolygonOnly="0" allowDegraded="0" quadOffset="1" repeatDistanceUnits="MM" lineAnchorPercent="0.5" lineAnchorType="0" rotationUnit="AngleDegrees" maxCurvedCharAngleIn="25" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR"/>
      <rendering labelPerPart="0" fontMaxPixelSize="10000" maxNumLabels="2000" drawLabels="1" zIndex="0" fontMinPixelSize="3" limitNumLabels="0" obstacleFactor="1" minFeatureSize="0" scaleMax="0" unplacedVisibility="0" scaleMin="0" scaleVisibility="0" fontLimitPixelSize="0" mergeLines="0" obstacle="1" upsidedownLabels="0" obstacleType="1"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option name="properties"/>
          <Option type="QString" value="collection" name="type"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
          <Option type="int" value="0" name="blendMode"/>
          <Option type="Map" name="ddProperties">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
          <Option type="bool" value="false" name="drawToAllParts"/>
          <Option type="QString" value="0" name="enabled"/>
          <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
          <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer id=&quot;{2401d2c3-8d23-4035-b250-9bdd9a77b5fa}&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
          <Option type="double" value="0" name="minLength"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
          <Option type="QString" value="MM" name="minLengthUnit"/>
          <Option type="double" value="0" name="offsetFromAnchor"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
          <Option type="double" value="0" name="offsetFromLabel"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>0</layerGeometryType>
</qgis>
