<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Labeling" version="3.40.8-Bratislava" labelsEnabled="1">
  <renderer-v2 forceraster="0" type="RuleRenderer" symbollevels="0" referencescale="-1" enableorderby="0">
    <rules key="{f0a4e334-269b-446d-a14b-a461bbc73ff0}">
      <rule symbol="0" label="Taajamatoimintojen alue" key="{3a9345dd-f98c-45ae-9896-66158a87b4a2}" filter=" map_akeys(&quot;primary_use&quot;) = array('taajamatoimintojenAlue')"/>
      <rule symbol="1" label="Asuntovaltainen alue" key="{5157f699-3a50-45aa-880b-6c5720957c46}" filter=" map_akeys(&quot;primary_use&quot;) = array('asumisenAlue')"/>
      <rule symbol="2" label="Kylä" key="{400a5290-bea6-43e4-b0f7-7e10c4027c66}" filter=" map_akeys(&quot;primary_use&quot;) = array('kylaAlue')"/>
      <rule symbol="3" label="Keskustatoimintojen alakeskus" key="{40310013-fe8e-4c1b-b4a8-3c2d233c4e44}" filter=" map_akeys(&quot;primary_use&quot;) = array('keskustatoimintojenAlakeskus')"/>
      <rule symbol="4" label="Keskustatoimintojen alue" key="{27aab51b-a5e7-4521-8c29-26953b50a58f}" filter=" map_akeys(&quot;primary_use&quot;) = array('keskustatoimintojenAlue')"/>
      <rule symbol="5" label="Työpaikka-alue" key="{a9721180-4815-44fa-ba9c-7f64b3fd4cf3}" filter=" map_akeys(&quot;primary_use&quot;) = array('tyopaikkojenAlue')"/>
      <rule symbol="6" label="Palvelujen alue" key="{741777a0-cc17-4f42-9173-da4266027cb7}" filter=" map_akeys(&quot;primary_use&quot;) = array('palvelujenAlue')"/>
      <rule symbol="7" label="Kaupallisten palvelujen alue, jolle saa sijoittaa vähittäiskaupan suuryksikön" key="{e8d41b4c-d8fb-4b02-806d-459b0887aada}" filter=" map_akeys(&quot;primary_use&quot;) = array('vahittaiskaupanSuuryksikko')"/>
      <rule symbol="8" label="Kaupallisten palvelujen alue, jolle saa sijoittaa vähittäiskaupan myymäläkeskittymän" key="{f815d99b-8ff0-4f70-a2ac-f036cd21d39b}" filter=" map_akeys(&quot;primary_use&quot;) = array('vahittaiskaupanMyymalakeskittyma')"/>
      <rule symbol="9" label="Teollisuus- ja varastoalue, jolla on/jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen" key="{8f778ba9-0d19-42fc-889e-f9578fbed355}" filter="array_sort( map_akeys(&quot;primary_use&quot;)) = array('teollisuusalue', 'varastoalue')&#xd;&#xa;AND map_akeys(&quot;primary_use&quot;['teollisuusalue']) = array('VaarallistenKemikaalienValmistusJaVarastointiSallittu')&#xd;&#xa;AND map_akeys(&quot;primary_use&quot;['varastoalue']) = array('VaarallistenKemikaalienValmistusJaVarastointiSallittu')&#xd;&#xa;"/>
      <rule symbol="10" label="Teollisuus- ja varastoalue" key="{64845cb7-7601-4770-867d-ebca1f936820}" filter="map_akeys(&quot;primary_use&quot;) = array('teollisuusalue', 'varastoalue')&#xa;AND&#xa;map_get(&quot;primary_use&quot;, 'teollisuusalue') IS NULL&#xa;AND&#xa;map_get(&quot;primary_use&quot;, 'varastoalue') IS NULL"/>
      <rule symbol="11" label="Ympäristövaikutuksiltaan&#xa;merkittävien teollisuustoimintojen alue" key="{8cc15e87-7e2e-4f55-ba3f-d486df3c8d6c}" filter="map_akeys(&quot;primary_use&quot;) = array('teollisuusalue')"/>
      <rule symbol="12" label="Virkistysalue" key="{e2b0b157-5a5e-4bc8-b8a6-d9faa8aee2c4}" filter="map_akeys(&quot;primary_use&quot;) = array('virkistysalue')"/>
      <rule symbol="13" label="Vapaa-ajan asumisen ja matkailun alue" key="{2ab8c6a9-5b2a-4a91-a4e0-68ced36d708d}" filter=" map_akeys(&quot;primary_use&quot;) = array('vapaaAjanAsumisenJaMatkailunAlue')"/>
      <rule symbol="14" label="Vapaa-ajan asumisen alue" key="{48939de1-3375-47e5-872f-3d5ba0290d08}" filter=" map_akeys(&quot;primary_use&quot;) = array('vapaaAjanAsumisenAlue')"/>
      <rule symbol="15" label="Matkailupalvelujen alue" key="{779da194-452a-47a7-8374-2b49f3e1a2a2}" filter=" map_akeys(&quot;primary_use&quot;) = array('matkailupalvelujenAlue')"/>
      <rule symbol="16" label="Liikennealue" key="{1f8fb89f-7dae-4ac9-9f28-db5de1868461}" filter="map_akeys(&quot;primary_use&quot;) = array('liikennealue')"/>
      <rule symbol="17" label="Maaliikenteen alue" key="{fbf8c530-112d-4637-949f-72cb5098812a}" filter="map_akeys(&quot;primary_use&quot;) = array('maaliikenteenAlue')"/>
      <rule symbol="18" label="Rautatieliikenteen alue" key="{f17e3197-9089-4fc8-b3fa-51e1eaefeded}" filter="map_akeys(&quot;primary_use&quot;) = array('raideliikenteenAlue')"/>
      <rule symbol="19" label="Lentoliikenteen alue" key="{2acb064c-8914-404d-b936-9c161867f143}" filter="map_akeys(&quot;primary_use&quot;) = array('lentoliikenteenAlue')"/>
      <rule symbol="20" label="Satama-alue" key="{9969ff71-19e5-45dc-831d-ecb517d81d03}" filter="map_akeys(&quot;primary_use&quot;) = array('satama-alue')"/>
      <rule symbol="21" label="Venesatama" key="{002b9221-901f-41fc-b771-5a547ef7ce5e}" filter="map_akeys(&quot;primary_use&quot;) = array('venesatama')"/>
      <rule symbol="22" label="Henkilöliikenteen terminaalialue" key="{bfa8d257-7887-4aa5-a6c1-af9bf84c6806}" filter="map_akeys(&quot;primary_use&quot;) = array('henkiloliikenteenTerminaalialue')"/>
      <rule symbol="23" label="Tavaraliikenteen terminaalialue" key="{2fb4955d-a0bf-472b-8329-a42a5caf32d6}" filter="map_akeys(&quot;primary_use&quot;) = array('tavaraliikenteenTerminaalialue')"/>
      <rule symbol="24" label="Varikkoalue" key="{b591434a-f8ee-4180-8043-07b033f9986e}" filter="map_akeys(&quot;primary_use&quot;) = array('varikko')"/>
      <rule symbol="25" label="Erityisalue" key="{4196eed8-6830-47ed-9bdd-94c4d3b281dc}" filter="map_akeys(&quot;primary_use&quot;) = array('erityisalue')"/>
      <rule symbol="26" label="Yhdyskuntateknisen&#xa;huollon alue" key="{e1382e0f-05c3-42e8-b39e-24b9c12d2fa4}" filter="map_akeys(&quot;primary_use&quot;) = array('yhdyskuntateknisenHuollonAlue')"/>
      <rule symbol="27" label="Energiahuollon alue" key="{e9376d90-6e88-473b-898f-160e09f68cfc}" filter="map_akeys(&quot;primary_use&quot;) = array('energiahuollonAlue')"/>
      <rule symbol="28" label="Jätteenkäsittelyalue" key="{6d8e04b4-b996-43f6-81ad-8d1fcf367b3a}" filter="map_akeys(&quot;primary_use&quot;) = array('jatteenkasittelyalue')"/>
      <rule symbol="29" label="Kiertotalouden alue" key="{4745c572-0158-4a46-abb9-8b86bf2974e6}" filter="map_akeys(&quot;primary_use&quot;) = array('kiertotaloudenAlue')"/>
      <rule symbol="30" label="Maa-ainesten ottoalue" key="{1b19920b-ec8f-48b6-8aa6-44977b9b75c2}" filter="map_akeys(&quot;primary_use&quot;) = array('maaAinestenOttoalue')"/>
      <rule symbol="31" label="Turvetuotannon alue" key="{b5a3fef7-daf8-488b-8e83-0a5c635cc1bd}" filter="map_akeys(&quot;primary_use&quot;) = array('turvetuotantoalue')"/>
      <rule symbol="32" label="Kaivosalue" key="{ddd268ec-842d-445a-ac69-dbc66fe6b7dc}" filter="map_akeys(&quot;primary_use&quot;) = array('kaivosalue')"/>
      <rule symbol="33" label="Moottoriurheilun alue" key="{6c634515-0051-42eb-91a5-a9c078f6c08e}" filter="map_akeys(&quot;primary_use&quot;) = array('moottoriurheilualue')"/>
      <rule symbol="34" label="Ampumarata-alue" key="{2d47c22f-2b30-4c8c-a979-030cbb216fa8}" filter="map_akeys(&quot;primary_use&quot;) = array('ampumarataAlue')"/>
      <rule symbol="35" label="Puolustusvoimien alue" key="{a1c1c3f5-055e-409c-8321-9a84185c159b}" filter="map_akeys(&quot;primary_use&quot;) = array('puolustusvoimienAlue')"/>
      <rule symbol="36" label="Suojelualue" key="{37d6564b-2fb0-4408-b073-c9252db5cd47}" filter="map_akeys(&quot;primary_use&quot;) = array('suojelualue')"/>
      <rule symbol="37" label="Luonnonsuojelualue" key="{398b6b3f-5f86-4645-9025-5c81601138cf}" filter="map_akeys(&quot;primary_use&quot;) = array('luonnonsuojelualue')"/>
      <rule symbol="38" label="Muinaismuistoalue" key="{3f704118-812d-4eae-8431-e58cd3f9efda}" filter="map_akeys(&quot;primary_use&quot;) = array('muinaismuistoAlue')"/>
      <rule symbol="39" label="Rakennussuojelualue" key="{d0e0d8b6-a8ed-4f52-a06b-ddb93d468fb5}" filter="map_akeys(&quot;primary_use&quot;) = array('rakennussuojelualue')"/>
      <rule symbol="40" label="Maa- ja metsätalousvaltainen alue" key="{46ec18e1-ce05-4ed6-8e7d-d98630b373b9}" filter="map_akeys(&quot;primary_use&quot;) = array('maaJaMetsatalousAlue')"/>
      <rule symbol="41" label="Metsätalousvaltainen alue" key="{4bad31f4-8a5d-43af-94b9-17b1c53ef3bb}" filter="map_akeys(&quot;primary_use&quot;) = array('metsatalousalue')"/>
      <rule symbol="42" label="Maatalousalue" key="{19e82f62-be3d-4c45-be2b-1db82d0931b3}" filter="map_akeys(&quot;primary_use&quot;) = array('maatalousalue')"/>
      <rule symbol="43" label="Maa- ja metsätalousalue,&#xa;jolla on erityistä ulkoilun&#xa;ohjaamistarvetta" key="{22614bb2-4df4-4a6c-bee3-ab1d995230b6}" filter="map_akeys(&quot;primary_use&quot;) = array('maaJaMetsatalousalueJollaErityistaUlkoilunOhjaamistarvetta')"/>
      <rule symbol="44" label="Maa- ja metsätalousalue,&#xa;jolla on erityisiä&#xa;ympäristöarvoja" key="{0766528a-a01a-4ce5-acfe-bd858a5a7efa}" filter="map_akeys(&quot;primary_use&quot;) = array('maaJaMetsatalousalueJollaErityisiaYmparistoarvoja')"/>
      <rule symbol="45" label="Vesialue" key="{311ac9cb-0e80-48b4-a724-787422412e65}" filter="map_akeys(&quot;primary_use&quot;) = array('vesialue')"/>
      <rule symbol="46" label="Kuvaustekniikkaa ei toteutettu" key="{6c40bf34-929c-418e-94f7-3427a76e2a2e}" filter="ELSE"/>
    </rules>
    <symbols>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="0" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="229,198,154,255,rgb:0.89803921568627454,0.77647058823529413,0.60392156862745094,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="1" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{02d1a9a3-35b6-4873-8c85-9a51d74e9f2d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="229,198,154,255,rgb:0.89803921568627454,0.77647058823529413,0.60392156862745094,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="10" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{6ad7b1b6-3706-4028-ad2a-cdcb010cac6f}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="139,140,141,255,rgb:0.54509803921568623,0.5490196078431373,0.55294117647058827,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="11" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{77ef69db-5e5a-45d9-9367-cee5ccc058d5}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="139,140,141,255,rgb:0.54509803921568623,0.5490196078431373,0.55294117647058827,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="12" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{da754a25-1de3-47a8-a28b-09f6d6232db3}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="90,168,50,255,rgb:0.35294117647058826,0.6588235294117647,0.19607843137254902,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="13" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,209,54,255,rgb:1,0.81960784313725488,0.21176470588235294,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="14" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{e178bb07-06b5-48ce-9244-88ba4bf50c8d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,209,54,255,rgb:1,0.81960784313725488,0.21176470588235294,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="15" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{cf8c0421-b12b-4a18-98d8-af21a0b219fd}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,209,54,255,rgb:1,0.81960784313725488,0.21176470588235294,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="16" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{435e5ef0-2ad1-4173-954a-0258276379d2}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="17" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{6730ac03-0142-4af9-9cd5-f13b966bb8bb}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="18" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{435de34a-452b-43a0-bf3b-fce6d97a4ae4}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="19" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{a5d28f23-cdda-4813-a30a-085d4e2fc7e4}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="2" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{1c363fbe-7e8a-4da1-8008-861f791646d5}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="229,198,154,255,rgb:0.89803921568627454,0.77647058823529413,0.60392156862745094,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="20" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{79f4926b-da9e-4966-a7fb-3e8cd5e9142d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="21" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{546fd6fe-249f-4317-9156-3568ddff6016}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,0,rgb:1,1,1,0" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="182,77,81,255,rgb:0.71372549019607845,0.30196078431372547,0.31764705882352939,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="3" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="22" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{67bbb71b-444d-4070-a57d-649dde820d33}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="249,221,235,255,rgb:0.97647058823529409,0.8666666666666667,0.92156862745098034,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="23" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{67bbb71b-444d-4070-a57d-649dde820d33}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="249,221,235,255,rgb:0.97647058823529409,0.8666666666666667,0.92156862745098034,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="24" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{e6e90bde-42e3-4832-b217-9edd7dba070d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="249,221,235,255,rgb:0.97647058823529409,0.8666666666666667,0.92156862745098034,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="25" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{d5e2dff0-682e-4e3b-9162-1e9e2e7e24f7}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="26" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c916f428-d560-4c4d-96fa-0d7efb96ed5c}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="27" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{932912bc-cd9f-4b74-86ec-1875d120d768}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="28" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="29" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="3" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{8a98fbb5-0721-4bee-86a4-d4492eef5b56}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="205,8,42,255,rgb:0.80392156862745101,0.03137254901960784,0.16470588235294117,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="30" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="31" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="32" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="33" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="34" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="35" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{5f29a017-0852-4821-8c8a-7268e644215d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="233,181,212,255,rgb:0.9137254901960784,0.70980392156862748,0.83137254901960789,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="36" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{7554776e-3a03-40e0-a89c-8a0570b33b0d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="198,229,232,255,rgb:0.77647058823529413,0.89803921568627454,0.90980392156862744,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="37" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{7554776e-3a03-40e0-a89c-8a0570b33b0d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="198,229,232,255,rgb:0.77647058823529413,0.89803921568627454,0.90980392156862744,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="38" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{7554776e-3a03-40e0-a89c-8a0570b33b0d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="198,229,232,255,rgb:0.77647058823529413,0.89803921568627454,0.90980392156862744,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="39" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{7554776e-3a03-40e0-a89c-8a0570b33b0d}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="198,229,232,255,rgb:0.77647058823529413,0.89803921568627454,0.90980392156862744,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="4" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="205,8,42,255,rgb:0.80392156862745101,0.03137254901960784,0.16470588235294117,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="40" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{ec8c5e7a-5005-4f3c-ae52-adde9625bf87}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="223,223,61,255,rgb:0.87450980392156863,0.87450980392156863,0.23921568627450981,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="41" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{da2d2cb2-6dfe-4362-a6b9-4c479b0829dc}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="104,139,53,255,rgb:0.40784313725490196,0.54509803921568623,0.20784313725490197,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="42" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{e09c204a-d74c-472a-bfad-3094b1124059}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="245,241,173,255,rgb:0.96078431372549022,0.94509803921568625,0.67843137254901964,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="43" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{8bed3793-f1a4-4440-b8ee-c45836a20bf8}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="201,224,180,255,rgb:0.78823529411764703,0.8784313725490196,0.70588235294117652,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="44" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{8bed3793-f1a4-4440-b8ee-c45836a20bf8}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="201,224,180,255,rgb:0.78823529411764703,0.8784313725490196,0.70588235294117652,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="45" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{bf1feecc-4fb6-4004-993d-2ff3ca052c0a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="193,221,245,255,rgb:0.75686274509803919,0.8666666666666667,0.96078431372549022,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="46" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{ffc2a232-462f-41fe-94ce-82e5651f4412}" class="SimpleLine">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="215,0,0,255,rgb:0.84313725490196079,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" id="{7981cbc5-0f70-4a83-adcc-73236a3a8493}" class="LinePatternFill">
          <Option type="Map">
            <Option value="45" type="QString" name="angle"/>
            <Option value="during_render" type="QString" name="clip_mode"/>
            <Option value="0,0,255,255,rgb:0,0,1,1" type="QString" name="color"/>
            <Option value="feature" type="QString" name="coordinate_reference"/>
            <Option value="1" type="QString" name="distance"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="distance_map_unit_scale"/>
            <Option value="MM" type="QString" name="distance_unit"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="line_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" alpha="1" clip_to_extent="1" frame_rate="10" name="@46@1" is_animated="0" force_rhr="0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" id="{344c34f1-cf1a-4972-81c1-f3b9e0b3b38b}" class="SimpleLine">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="MM" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="215,0,0,255,rgb:0.84313725490196079,0,0,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="0.26" type="QString" name="line_width"/>
                <Option value="MM" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="MM" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="MM" type="QString" name="trim_distance_start_unit"/>
                <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
                <Option value="0" type="QString" name="use_custom_dash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="5" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="241,143,159,255,rgb:0.94509803921568625,0.5607843137254902,0.62352941176470589,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="6" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="248,174,73,255,rgb:0.97254901960784312,0.68235294117647061,0.28627450980392155,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="7" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{2a981ad9-30ee-4ca1-ba1e-7d91257ed5ef}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="248,174,73,255,rgb:0.97254901960784312,0.68235294117647061,0.28627450980392155,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="8" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{4bea0115-eb49-4b73-8b3e-14b43c688158}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="248,174,73,255,rgb:0.97254901960784312,0.68235294117647061,0.28627450980392155,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="9" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{c307099c-8a06-439d-916f-0659e7b0996a}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="139,140,141,255,rgb:0.54509803921568623,0.5490196078431373,0.55294117647058827,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="1" type="QString" name="outline_width"/>
            <Option value="Point" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="" is_animated="0" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" id="{a953e75a-2580-4a11-acac-659ad92defc4}" class="SimpleFill">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="0,0,255,255,rgb:0,0,1,1" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.26" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style capitalization="0" fontLetterSpacing="0" fontWeight="75" fontKerning="1" fieldName="array_to_string(&quot;short_names&quot;, '/')" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" forcedItalic="0" textOrientation="horizontal" fontSize="18" fontItalic="0" namedStyle="Bold" forcedBold="0" tabStopDistance="80" fontSizeUnit="Point" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" textOpacity="1" isExpression="1" tabStopDistanceUnit="Point" allowHtml="0" fontFamily="Open Sans" fontUnderline="0" legendString="Aa" blendMode="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" multilineHeightUnit="Percentage" fontWordSpacing="0" multilineHeight="1" useSubstitutions="0">
        <families/>
        <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferDraw="0" bufferOpacity="1" bufferSizeUnits="MM" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1"/>
        <text-mask maskedSymbolLayers="" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSize2="1.5" maskType="0" maskJoinStyle="128" maskOpacity="1" maskEnabled="0" maskSize="1.5"/>
        <background shapeBorderWidth="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeType="0" shapeSizeUnit="Point" shapeRotationType="0" shapeJoinStyle="64" shapeOffsetY="0" shapeSizeType="0" shapeOffsetX="0" shapeRadiiX="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeSizeY="0" shapeSVGFile="" shapeBorderWidthUnit="Point" shapeBlendMode="0" shapeSizeX="0" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeRadiiUnit="Point" shapeSizeMapUnitScale="3x:0,0,0,0,0,0">
          <symbol type="marker" alpha="1" clip_to_extent="1" frame_rate="10" name="markerSymbol" is_animated="0" force_rhr="0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" id="" class="SimpleMarker">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="152,125,183,255,rgb:0.59607843137254901,0.49019607843137253,0.71764705882352942,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="MM" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="2" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="MM" type="QString" name="size_unit"/>
                <Option value="1" type="QString" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol type="fill" alpha="1" clip_to_extent="1" frame_rate="10" name="fillSymbol" is_animated="0" force_rhr="0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" locked="0" id="" class="SimpleFill">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" type="QString" name="outline_color"/>
                <Option value="no" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
                <Option value="solid" type="QString" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetDist="1" shadowOffsetAngle="135" shadowBlendMode="6" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.69999999999999996" shadowScale="100" shadowRadiusUnit="MM" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOffsetGlobal="1" shadowUnder="0"/>
        <dd_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format autoWrapLength="0" rightDirectionSymbol=">" wrapChar="" reverseDirectionSymbol="0" formatNumbers="0" addDirectionSymbol="0" decimals="3" multilineAlign="3" plussign="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" placeDirectionSymbol="0"/>
      <placement distMapUnitScale="3x:0,0,0,0,0,0" dist="0" maximumDistanceUnit="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" yOffset="0" quadOffset="4" rotationAngle="0" repeatDistanceUnits="MM" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetUnits="MM" lineAnchorPercent="0.5" centroidWhole="0" rotationUnit="AngleDegrees" placementFlags="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" prioritization="PreferCloser" geometryGeneratorEnabled="0" maxCurvedCharAngleIn="25" distUnits="MM" centroidInside="0" overlapHandling="PreventOverlap" maximumDistance="0" allowDegraded="0" lineAnchorClipping="0" overrunDistanceUnit="MM" priority="5" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" placement="0" offsetType="0" layerType="PolygonGeometry" overrunDistance="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" fitInPolygonOnly="0" preserveRotation="1"/>
      <rendering limitNumLabels="0" unplacedVisibility="0" scaleMax="0" minFeatureSize="0" fontLimitPixelSize="0" drawLabels="1" fontMinPixelSize="3" obstacleType="1" scaleVisibility="0" obstacle="1" zIndex="0" maxNumLabels="2000" scaleMin="0" labelPerPart="0" fontMaxPixelSize="10000" obstacleFactor="1" mergeLines="0" upsidedownLabels="0"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" type="QString" name="name"/>
          <Option name="properties"/>
          <Option value="collection" type="QString" name="type"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
          <Option value="0" type="int" name="blendMode"/>
          <Option type="Map" name="ddProperties">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
          <Option value="false" type="bool" name="drawToAllParts"/>
          <Option value="0" type="QString" name="enabled"/>
          <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
          <Option value="&lt;symbol type=&quot;line&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; name=&quot;symbol&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot; id=&quot;{82ea2b33-1627-411f-b9a5-ab9f124d4de3}&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
          <Option value="0" type="double" name="minLength"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
          <Option value="MM" type="QString" name="minLengthUnit"/>
          <Option value="0" type="double" name="offsetFromAnchor"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
          <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
          <Option value="0" type="double" name="offsetFromLabel"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
          <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>2</layerGeometryType>
</qgis>
