<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" styleCategories="Symbology|Labeling" version="3.40.9-Bratislava">
  <renderer-v2 symbollevels="0" enableorderby="0" type="RuleRenderer" forceraster="0" referencescale="-1">
    <rules key="{178e2009-9047-4176-9ebc-9cb596008dd4}">
      <rule key="{20217ee9-52c5-4098-aa4b-45f239e12a1c}" filter="ELSE" symbol="0"/>
      <rule label="Nykyinen tie" key="{67098b2b-c7b1-4727-bd83-4d2a5febcd08}" filter="map_akeys(&quot;type_regulations&quot;) = array('tie')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'tie') IS NULL" symbol="1"/>
      <rule label="Moottori- tai moottoriliikennetie" key="{71233534-3647-4254-ab4e-2187e3ab0742}" filter="map_akeys(&quot;type_regulations&quot;) = array('moottoriTaiMoottoriliikenneTie')" symbol="2"/>
      <rule label="Kaksiajoratainen tie tai katu" key="{903c9f98-cd42-4ffd-83d5-a079d3fcc05b}" filter="map_akeys(&quot;type_regulations&quot;) = array('kaksiajoratainenTieTaiKatu')&#xa;" symbol="3"/>
      <rule label="Valtatie tai kantatie" key="{6101e3f2-3657-494a-ba45-850bbbc7fd1a}" filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('kantatie', 'valtatie')" symbol="4"/>
      <rule label="Valtatie" key="{7fd7f716-8a76-48fb-a7f9-c76001237174}" filter="map_akeys(&quot;type_regulations&quot;) = array('valtatie')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'valtatie') IS NULL" symbol="5"/>
      <rule label="Kantatie" key="{d0c7fc7b-9ff1-49cf-aab4-75aada06ccaf}" filter="map_akeys(&quot;type_regulations&quot;) = array('kantatie')" symbol="6"/>
      <rule label="Seututie tai pääkatu" key="{44525622-070c-4471-a3a7-46f008ba8620}" filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('paakatu', 'seututie')" symbol="7"/>
      <rule label="Seututie" key="{6a34abbc-f383-4161-a5af-abe469946ddc}" filter="map_akeys(&quot;type_regulations&quot;) = array('seututie')" symbol="8"/>
      <rule label="Pääkatu" key="{792a7b80-beaf-4c1d-a197-5203a90c62c1}" filter="map_akeys(&quot;type_regulations&quot;) = array('paakatu')" symbol="9"/>
      <rule label="Yhdystie" key="{7b22538e-f2b4-4311-ba19-8bcb222a154a}" filter="map_akeys(&quot;type_regulations&quot;) = array('yhdystie')" symbol="10"/>
      <rule label="Rautatie" key="{a98bce27-0290-4dfb-858f-073cc2c872c4}" filter="map_akeys(&quot;type_regulations&quot;) = array('raideliikenteenAlue')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'raideliikenteenAlue') IS NULL" symbol="11"/>
      <rule label="Päärata" key="{8f4efa89-4f16-4b9e-959c-3c678ce4eb9a}" filter="map_akeys(&quot;type_regulations&quot;) = array('paarata')" symbol="12"/>
      <rule label="Yhdysrata" key="{e036841f-7968-4755-bbaf-2eccc1895778}" filter="map_akeys(&quot;type_regulations&quot;) = array('yhdysrata')" symbol="13"/>
      <rule label="Sivurata" key="{b78e78f6-b84a-46df-98e1-95f765d962b0}" filter="map_akeys(&quot;type_regulations&quot;) = array('sivurata')" symbol="14"/>
      <rule label="Kaupunkirata" key="{0603add6-11ca-428e-a0d4-fbef5c3ee594}" filter="map_akeys(&quot;type_regulations&quot;) = array('kaupunkirata')" symbol="15"/>
      <rule label="Liikennetunneli" key="{37891b3d-4865-41ad-82fa-aa03f5727092}" filter="map_akeys(&quot;type_regulations&quot;) = array('liikennetunneli')" symbol="16"/>
      <rule label="Moottorikelkkailureitti" key="{30a4ce73-39f2-4b3d-94e5-77d9ce2bb7fb}" filter="map_akeys(&quot;type_regulations&quot;) = array('moottorikelkkailureitti')" symbol="17"/>
      <rule label="Laivaväylä" key="{44e49c43-0c54-4c38-9e16-1d5c5f43a5c2}" filter="map_akeys(&quot;type_regulations&quot;) = array('laivavayla')" symbol="18"/>
      <rule label="Veneväylä" key="{620ed046-20ad-41cc-a218-22ec1828c84b}" filter="map_akeys(&quot;type_regulations&quot;) = array('venevayla')" symbol="19"/>
      <rule label="Lossi- tai lauttayhteys" key="{f60df711-5cc6-4c66-93d5-75524ce4a506}" filter="map_akeys(&quot;type_regulations&quot;) = array('lossiTaiLauttaYhteys')" symbol="20"/>
      <rule label="Nykyinen tie - olemassa oleva" key="{5e62f549-e28d-400b-98be-6cce6338161e}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'olemassaOleva')" symbol="21"/>
      <rule label="Uusi tie" key="{5eb48288-6088-4741-a782-c8332c4ac895}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'uusi')" symbol="22"/>
      <rule label="Uusi tie" key="{43fc452b-c793-40d4-a03b-5d4cccba7a1d}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'merkittavastiParannettava')" symbol="23"/>
      <rule label="Valtatie - olemassa oleva" key="{ff18458f-6403-4ed1-8477-c3341ad5b4c2}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'olemassaOleva')" symbol="24"/>
      <rule label="Uusi valtatie" key="{89ab51ca-9860-4610-a4bb-4696907e941e}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'uusi')" symbol="25"/>
      <rule label="Merkittävästi parannettava valtatie" key="{29b8e7aa-0354-4d55-a108-0e66af591a3c}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'merkittavastiParannettava')" symbol="26"/>
      <rule label="Tieliikenteen yhteystarve" key="{23054690-65d4-45e7-a5c6-42843ee054ea}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'yhteystarve')" symbol="27"/>
      <rule label="Valtatien yhteystarve" key="{6251c84e-c449-487c-81c7-ed638d6a2cd9}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'yhteystarve')" symbol="28"/>
      <rule label="Ohjeellinen valtatie" key="{f7d6210b-b460-467d-b9ff-dbbdc8ba9da2}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'ohjeellinenSijainti')" symbol="29"/>
      <rule label="Vaihtoehtoinen valtatie" key="{38105b36-b91a-4a72-8e13-c3f620ff5421}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'vaihtoehtoinen')" symbol="30"/>
      <rule label="Raideliikenteen yhteystarve" key="{1f55ab69-7e60-4a63-94cc-1b83d6b6458b}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'raideliikenteenAlue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'raideliikenteenAlue')), 'yhteystarve')" symbol="31"/>
      <rule label="Joukkoliikenteen kehittämiskäytävä" key="{84e0192a-04c2-4529-8cbc-f434616051cf}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'joukkoliikenteenAlue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'joukkoliikenteenAlue')), 'kehitettava')" symbol="32"/>
      <rule label="Jalankulun ja pyöräilyn yhteystarve" key="{65e1875c-e1b4-4dfe-acf0-947c78eff78f}" filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'jalankulkualue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')), 'yhteystarve')&#xa;AND&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'pyorailyalue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')), 'yhteystarve')" symbol="33"/>
      <rule label="Jalankulun yhteystarve" key="{31db06af-f599-457a-b7ce-06b8433cc5ca}" filter="map_akeys(&quot;type_regulations&quot;) = array('jalankulkualue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')) = array('yhteystarve')" symbol="34"/>
      <rule label="Pyöräilyn yhteystarve" key="{be570d05-afb3-42d8-ac59-3a5ed1c1600c}" filter="map_akeys(&quot;type_regulations&quot;) = array('pyorailyalue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')) = array('yhteystarve')" symbol="35"/>
      <rule label="Viheryhteys" key="{fa229435-2ad4-4b8f-a334-b3effc7a53c0}" filter="map_akeys(&quot;type_regulations&quot;) = array('viheryhteys')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'viheryhteys') IS NULL" symbol="36"/>
      <rule label="Viheryhteystarve" key="{6077dce3-b7c5-46e2-a096-dc76c43fca4c}" filter="map_akeys(&quot;type_regulations&quot;) = array('viheryhteys')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'viheryhteys')) = array('yhteystarve')" symbol="37"/>
      <rule label="Sähkölinja" key="{874ed9d8-89f9-4c73-a4f8-373cd066112d}" filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'sahkolinja') IS NULL" symbol="38"/>
      <rule label="Vesijohto tai viemäri" key="{6644aed6-61f7-46f7-94f6-b154c7186dc2}" filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari') IS NULL" symbol="39"/>
      <rule label="Kaasulinja" key="{6274e6f7-0236-49a2-a434-97fe984faebb}" filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'kaasulinja') IS NULL" symbol="40"/>
      <rule label="Uusi sähkölinja" key="{202bbd74-afd1-4045-bb53-5ab5f90b0cfa}" filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('uusi')" symbol="41"/>
      <rule label="Uusi vesijohto tai viemäri" key="{b0f66703-7f3c-4fff-a9ea-9f62faeb1d0f}" filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('uusi')" symbol="42"/>
      <rule label="Uusi kaasulinja" key="{f8275de9-3676-4d13-8562-85c9f444baef}" filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('uusi')" symbol="43"/>
      <rule label="Sähkölinjan yhteystarve" key="{3f0060c1-1911-4c66-b36e-bdcdff2f7e9d}" filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('yhteystarve')" symbol="44"/>
      <rule label="Vesijohdon tai viemärin yhteystarve" key="{21f000d1-7099-4e51-9685-39e73e6aaed6}" filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('yhteystarve')" symbol="45"/>
      <rule label="Kaasulinjan yhteystarve" key="{2bca7222-658a-472a-b5ef-7923b0e9bc53}" filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('yhteystarve')" symbol="46"/>
      <rule label="Historiallinen tie" key="{0236b4c3-7fc6-4478-acbd-dec99c141f86}" filter="map_akeys(&quot;type_regulations&quot;) = array('historiallinenKohde')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'historiallinenKohde') IS NULL" symbol="47"/>
      <rule label="Ulkoilu- tai virkistysreitti" key="{41f233b8-d959-4cce-a00e-fbe5d40910a8}" filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti') IS NULL" symbol="48"/>
      <rule label="Uusi ulkoilu- tai virkistysreitti" key="{d5652e83-42d2-4615-a2ad-53b855bb3182}" filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti')) = array('uusi')" symbol="49"/>
      <rule label="Ulkoilu- tai virkistysreitin yhteystarve" key="{c62c9297-0f9a-46cf-9e48-9e77385b9e7a}" filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti')) = array('yhteystarve')" symbol="50"/>
      <rule label="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö" key="{f163734d-0d48-4b8a-8ad1-91a8d908de7a}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'],&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)" symbol="51"/>
      <rule label="Natura 2000 -verkostoon kuuluva alue" key="{4d0bd845-1b4c-4785-a671-21d154a1f647}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'natura2000VerkostonAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['natura2000VerkostonAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" symbol="52"/>
      <rule label="Luonnon &#xa;monimuotoisuuden kannalta erityisen tärkeä alue" key="{2f802cb9-1fcf-41ca-a746-185b562f22d5}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" symbol="53"/>
      <rule label="Yhdyskuntarakenteen laajenemissuunta" key="{1c73678f-9182-4917-91ac-d3be82a21409}" filter="map_akeys(&quot;type_regulations&quot;) = array('yhdyskuntarakenteenLaajenemissuunta')" symbol="54"/>
      <rule label="Liikenteen yhteystarve" key="{46e91e2d-23d2-4412-b4a2-f7fbaeab1f4a}" filter="map_akeys(&quot;type_regulations&quot;) = array('kehittamisvyohyke')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kehittamisvyohyke')) = array('yhteystarve')" symbol="55"/>
      <rule label="Joki tai muu avouoma" key="{4f8ad91e-b296-4cfe-a919-249ce0983787}" filter="map_akeys(&quot;type_regulations&quot;) = array('vesialue')" symbol="56"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="0" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{bff5a665-c20a-4b9c-8fe9-d41b7e19539f}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="45" type="QString" name="hash_angle"/>
            <Option value="1" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="2" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="MM" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@0@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{5ddeaaf4-9263-4cf3-bf10-9622178b4a1f}" locked="0">
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
                <Option value="221,35,35,255,rgb:0.8666666666666667,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="1" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="10" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="3" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="11" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="5" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@11@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1.5" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="12" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="5" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@12@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1.5" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="13" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="5" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@13@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1.5" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="14" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="5" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@14@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1.5" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="15" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="5" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@15@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1.5" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="16" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{5c39f1f5-4b0b-4be7-a2b6-13b41c7167d5}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="90" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="15" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="1.9" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@16@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8d9ec6c7-5d58-40dc-bb74-01bf746b0802}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="2" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="HashLine" id="{751c1e16-d2fe-467e-af1e-d3f52fffc4bb}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="90" type="QString" name="hash_angle"/>
            <Option value="3" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="MM" type="QString" name="hash_length_unit"/>
            <Option value="15" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="-1.9" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@16@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{25a29b12-86f5-45d4-808b-451b0058b8c7}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="2" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="17" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="HashLine" id="{8f2a7c15-775f-49ec-bb29-8a6c014f884a}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="90" type="QString" name="hash_angle"/>
            <Option value="5" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="Point" type="QString" name="hash_length_unit"/>
            <Option value="10" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="-3" type="QString" name="offset"/>
            <Option value="3" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@17@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{0c095a22-8dd9-4e65-9784-4bc178f6ce8e}" locked="0">
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
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
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
        <layer enabled="1" pass="0" class="HashLine" id="{dd88cfd4-0cde-43d0-b51b-602719f8af27}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="90" type="QString" name="hash_angle"/>
            <Option value="5" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="Point" type="QString" name="hash_length_unit"/>
            <Option value="10" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="3" type="QString" name="offset"/>
            <Option value="3" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@17@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{8d1da158-9c47-4089-ae61-34550acf3a95}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="HashLine" id="{c7fcb617-7ccd-4853-9b09-e7ede2a2b5e8}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="0" type="QString" name="hash_angle"/>
            <Option value="5" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="Point" type="QString" name="hash_length_unit"/>
            <Option value="10" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@17@2" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{ff95c9f2-daff-4264-b75f-490a7caeb416}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="18" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="13" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@18@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="6" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="Point" type="QString" name="size_unit"/>
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
        </layer>
        <layer enabled="1" pass="0" class="SimpleLine" id="{2abfdf4f-4a9a-45e5-9bbe-e4aa29c087c5}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="19" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="15" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@19@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="1" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="6" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="Point" type="QString" name="size_unit"/>
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
        </layer>
        <layer enabled="1" pass="0" class="HashLine" id="{0d357d8a-d521-453e-92ba-f5b974037921}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="90" type="QString" name="hash_angle"/>
            <Option value="8" type="QString" name="hash_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
            <Option value="Point" type="QString" name="hash_length_unit"/>
            <Option value="15" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="7" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@19@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleLine" id="{a75de32d-2071-4543-896a-cd329adc0907}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="Point" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="1" type="QString" name="line_width"/>
                <Option value="Point" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="2" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{25c4fb42-15ec-424f-997d-3fbfcd0d24da}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="-2.5" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{61e84333-9081-418c-9840-8a0bedf23d3d}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="2.5" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{713ea345-8053-41b3-bd94-bfab2ee2b903}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="20" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="13" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@20@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="6" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="Point" type="QString" name="size_unit"/>
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
        </layer>
        <layer enabled="1" pass="0" class="SimpleLine" id="{2abfdf4f-4a9a-45e5-9bbe-e4aa29c087c5}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="21" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="22" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="23" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{358cf78f-0827-4563-90a2-287dcc41d797}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2.25" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="24" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="25" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="26" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{358cf78f-0827-4563-90a2-287dcc41d797}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="2.25" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="27" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@27@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@27@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@27@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="28" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@28@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@28@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@28@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="29" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@29@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="3" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="15" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@29@0@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="3" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{68b416ff-0f22-4a27-95a1-c4546fc5f21f}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="3" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="3" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" id="{7f1e5810-df05-4546-aa14-23b5373f1844}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="3" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="-3" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="30" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@30@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="0.5" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@30@0@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="31" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" locked="0">
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
            <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="2" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="2" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        <layer enabled="1" pass="0" class="ArrowLine" id="{61921724-1c3f-41d4-b76c-2b6311851808}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="1" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@31@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{453c2540-89fc-4a30-af74-a6ecefb378f9}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{be35e3da-0861-4706-908f-d2ac57c7331b}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="@geometry" type="QString" name="geometryModifier"/>
            <Option value="MapUnit" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@31@2" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{df7b1142-8c98-4ffe-9245-df391b5cc6ac}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="MM" type="QString" name="average_angle_unit"/>
                <Option value="0" type="QString" name="hash_angle"/>
                <Option value="3" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="MM" type="QString" name="hash_length_unit"/>
                <Option value="4" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval|LastVertex|FirstVertex" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@31@2@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="1" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="32" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@32@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@32@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@32@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="33" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@33@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@33@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@33@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="34" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@34@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@34@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@34@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="35" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@35@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@35@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@35@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="36" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{93c298c0-123a-4d08-9582-9e409d858110}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="7" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@36@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{1c9e73ae-d42d-4bae-a385-2d99a32d32f9}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="213,180,60,255,rgb:0.83529411764705885,0.70588235294117652,0.23529411764705882,1" type="QString" name="outline_color"/>
                <Option value="no" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="37" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@37@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@37@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@37@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="38" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="39" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="4" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="40" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="41" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="42" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="43" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" locked="0">
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
            <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="44" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="4" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@44@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@44@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="4" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@44@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="1" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="45" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="4" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@45@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@45@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="4" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@45@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="1" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="46" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="4" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@46@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@46@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="4" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@46@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="1" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="47" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" locked="0">
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
            <Option value="124,217,204,255,rgb:0.48627450980392156,0.85098039215686272,0.80000000000000004,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="48" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{be582606-510c-4a5f-a69e-01bfa27474ff}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="3" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="MM" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@48@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0.5" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="49" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{be582606-510c-4a5f-a69e-01bfa27474ff}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="3" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="MM" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@49@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0.5" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="5" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="50" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{644c1d0a-ce9b-4e3a-8e27-3930a6b21a8f}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > (2) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            10,&#xa;            length($geometry) - 8&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@50@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="MarkerLine" id="{2d99c1db-caad-4488-af10-7fe52e51b266}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="MM" type="QString" name="average_angle_unit"/>
                <Option value="3" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="MM" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="@@50@0@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0.5" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" class="ArrowLine" id="{9ff3dc2f-4946-4e73-baf9-11d695921d98}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="2" type="QString" name="head_length"/>
            <Option value="MM" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="2" type="QString" name="head_thickness"/>
            <Option value="MM" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@50@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{d31c8c7c-3653-40b7-9cad-9d01be6cbb48}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="35,35,35,0,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,0" type="QString" name="outline_color"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="51" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{f57eba6b-1712-4eb0-a30d-1cef77422d06}" locked="0">
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
            <Option value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="1.25" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="52" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="MarkerLine" id="{394de993-20d3-4bd0-9c6c-358039a3eb8d}" locked="0">
          <Option type="Map">
            <Option value="4" type="QString" name="average_angle_length"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
            <Option value="MM" type="QString" name="average_angle_unit"/>
            <Option value="3" type="QString" name="interval"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
            <Option value="Point" type="QString" name="interval_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="0" type="QString" name="offset_along_line"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_along_line_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="true" type="bool" name="place_on_every_part"/>
            <Option value="Interval" type="QString" name="placements"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="1" type="QString" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="marker" is_animated="0" name="@52@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="{022f2612-398f-4d5f-b472-4f659b787a08}" locked="0">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="255,0,0,255,rgb:1,0,0,1" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="Point" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="0.75" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="Point" type="QString" name="size_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="53" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{8ecf55d0-a946-461d-9ae9-6f1c30fc5e62}" locked="0">
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
            <Option value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString" name="line_color"/>
            <Option value="dash dot" type="QString" name="line_style"/>
            <Option value="1" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="54" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{50275a2d-a0cc-4563-a4bf-a99f2011a7aa}" locked="0">
          <Option type="Map">
            <Option value="5" type="QString" name="arrow_start_width"/>
            <Option value="Point" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="5" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="15" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="7.5" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="0" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@54@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{48d25de5-881f-4d77-8eae-c4fa9a833d07}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="231,113,72,0,rgb:0.90588235294117647,0.44313725490196076,0.28235294117647058,0" type="QString" name="outline_color"/>
                <Option value="no" type="QString" name="outline_style"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="55" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="ArrowLine" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" locked="0">
          <Option type="Map">
            <Option value="1" type="QString" name="arrow_start_width"/>
            <Option value="MM" type="QString" name="arrow_start_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_start_width_unit_scale"/>
            <Option value="0" type="QString" name="arrow_type"/>
            <Option value="0" type="QString" name="arrow_width"/>
            <Option value="Point" type="QString" name="arrow_width_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="arrow_width_unit_scale"/>
            <Option value="10" type="QString" name="head_length"/>
            <Option value="Point" type="QString" name="head_length_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_length_unit_scale"/>
            <Option value="10" type="QString" name="head_thickness"/>
            <Option value="Point" type="QString" name="head_thickness_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="head_thickness_unit_scale"/>
            <Option value="2" type="QString" name="head_type"/>
            <Option value="1" type="QString" name="is_curved"/>
            <Option value="1" type="QString" name="is_repeated"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_unit_scale"/>
            <Option value="0" type="QString" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="fill" is_animated="0" name="@55@0" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" locked="0">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" type="QString" name="outline_color"/>
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
        </layer>
        <layer enabled="1" pass="0" class="GeometryGenerator" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" locked="0">
          <Option type="Map">
            <Option value="Line" type="QString" name="SymbolType"/>
            <Option value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" type="QString" name="geometryModifier"/>
            <Option value="Point" type="QString" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" type="line" is_animated="0" name="@55@1" alpha="1" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="HashLine" id="{410325a0-e6d3-4692-8772-82224a61351d}" locked="0">
              <Option type="Map">
                <Option value="4" type="QString" name="average_angle_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="average_angle_map_unit_scale"/>
                <Option value="Point" type="QString" name="average_angle_unit"/>
                <Option value="90" type="QString" name="hash_angle"/>
                <Option value="1" type="QString" name="hash_length"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="hash_length_map_unit_scale"/>
                <Option value="Point" type="QString" name="hash_length_unit"/>
                <Option value="12" type="QString" name="interval"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="interval_map_unit_scale"/>
                <Option value="Point" type="QString" name="interval_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="0" type="QString" name="offset_along_line"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_along_line_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_along_line_unit"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="Point" type="QString" name="offset_unit"/>
                <Option value="true" type="bool" name="place_on_every_part"/>
                <Option value="Interval" type="QString" name="placements"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="1" type="QString" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" type="QString" name="name"/>
                  <Option name="properties"/>
                  <Option value="collection" type="QString" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" type="line" is_animated="0" name="@@55@1@0" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleLine" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="align_dash_pattern"/>
                    <Option value="square" type="QString" name="capstyle"/>
                    <Option value="5;2" type="QString" name="customdash"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                    <Option value="Point" type="QString" name="customdash_unit"/>
                    <Option value="0" type="QString" name="dash_pattern_offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
                    <Option value="0" type="QString" name="draw_inside_polygon"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
                    <Option value="solid" type="QString" name="line_style"/>
                    <Option value="7" type="QString" name="line_width"/>
                    <Option value="Point" type="QString" name="line_width_unit"/>
                    <Option value="0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="Point" type="QString" name="offset_unit"/>
                    <Option value="0" type="QString" name="ring_filter"/>
                    <Option value="0" type="QString" name="trim_distance_end"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_end_unit"/>
                    <Option value="0" type="QString" name="trim_distance_start"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                    <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" is_animated="0" name="56" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{e5ff37ef-d0d9-44c3-94e7-a4765b94a4bd}" locked="0">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="Point" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="193,221,245,255,rgb:0.75686274509803919,0.8666666666666667,0.96078431372549022,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="3" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="Point" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="Point" type="QString" name="trim_distance_start_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="6" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="7" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="7" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="5" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="8" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="5" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="9" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" locked="0">
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
            <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="5" type="QString" name="line_width"/>
            <Option value="Point" type="QString" name="line_width_unit"/>
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
      <symbol clip_to_extent="1" type="line" is_animated="0" name="" alpha="1" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{caf62504-e233-4f5d-a577-bd90a633f492}" locked="0">
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
            <Option value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" type="QString" name="line_color"/>
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
    </selectionSymbol>
  </selection>
  <labeling type="rule-based">
    <rules key="{0e086683-45db-46cd-9a6d-75f92d1cdc44}">
      <rule key="{4e96cd72-fdd9-4b18-bfff-efcd5310fce0}" filter="map_akeys(&quot;type_regulations&quot;) = array('liikennetunneli')" description="Liikennetunneli">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="0" shapeRotation="0" shapeSizeX="0" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="0" shapeType="0" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="141,90,153,255,rgb:0.55294117647058827,0.35294117647058826,0.59999999999999998,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
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
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="-6" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="10" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{bdec80e5-7b98-428d-8f73-2f9193e43c18}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{ba75a71a-7c69-4ebd-985d-316bd4295fc4}" filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'sahkolinja') IS NULL&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari') IS NULL&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'kaasulinja') IS NULL" description="Sähkölinja, vesijohto, kaasulinja">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="1" shapeRotation="0" shapeSizeX="0" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="0,0,0,255,rgb:0,0,0,1" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="0.75" shapeType="3" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255,rgb:0.71764705882352942,0.28235294117647058,0.29411764705882354,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="0,0,0,255,rgb:0,0,0,1" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0.75" type="QString" name="outline_width"/>
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
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="-5" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="9" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{f3cd6cb4-4d36-49b5-8197-c1483c454a14}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{9b089a75-4371-4b5b-a380-ca23a1fe003c}" filter="(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;    AND&#xa;    (&#xa;        map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('uusi')&#xa;        OR&#xa;        map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('yhteystarve')&#xa;    )&#xa;)&#xa;OR&#xa;(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;    AND&#xa;&#x9;(&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('uusi')&#xa;&#x9;&#x9;OR&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('yhteystarve')&#xa;&#x9;)&#xa;)&#xa;OR&#xa;(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;    AND&#xa;&#x9;(&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('uusi')&#xa;&#x9;&#x9;OR&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('yhteystarve')&#xa;&#x9;)&#xa;)" description="Uusi/yhteystarve sähkölinja, kaasulinja tai vesijohto">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="1" shapeRotation="0" shapeSizeX="0" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" shapeOffsetY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="0.75" shapeType="3" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="255,158,23,255,rgb:1,0.61960784313725492,0.09019607843137255,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0.75" type="QString" name="outline_width"/>
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
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="MM" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="0" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="9" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{e0161c43-c9d4-4862-8f31-0efb003d8405}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{aebd6e87-8b2c-4703-8210-09631328d0f3}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'],&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)" description="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="124,217,204,255,rgb:0.48627450980392156,0.85098039215686272,0.80000000000000004,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="10" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="Point"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="Point" maskJoinStyle="128" maskEnabled="0" maskSize="15" maskedSymbolLayers="" maskSize2="15" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="1" shapeRotation="0" shapeSizeX="2" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" shapeOffsetY="-1.5" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="1" shapeType="2" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="133,182,111,255,rgb:0.52156862745098043,0.71372549019607845,0.43529411764705883,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" type="QString" name="outline_color"/>
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
            </background>
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="2" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="10" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{bbd4a37a-a256-427c-9ba4-a5e720e7120b}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{8dd601ab-16e8-4cbe-9d2b-d0b59a137f79}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'natura2000VerkostonAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['natura2000VerkostonAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" description="Natura 2000">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="150,150,150,255,rgb:0.58823529411764708,0.58823529411764708,0.58823529411764708,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="1" shapeRotation="0" shapeSizeX="2" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="128,128,128,131,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,0.51526665140764472" shapeOffsetY="-1.5" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="1" shapeType="2" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="229,182,54,255,rgb:0.89803921568627454,0.71372549019607845,0.21176470588235294,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,131,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,0.51526665140764472" type="QString" name="outline_color"/>
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
            </background>
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="2" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="10" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{8c8c7e34-545b-4859-bd2a-5b1daf4a1d9f}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{ed78956e-f351-429f-a171-92abad73c5ac}" filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" description="Luonnon monimuotoisuuden kannalta erityisen tärkeä alue">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="1" shapeRotation="0" shapeSizeX="2" shapeOpacity="1" shapeSizeY="0" shapeRadiiY="0" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeOffsetY="-1.5" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="0" shapeType="2" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255,rgb:0.71764705882352942,0.28235294117647058,0.29411764705882354,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" type="QString" name="outline_color"/>
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
            </background>
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="2" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="10" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{8a8a75b0-c2d8-4e2e-ab30-7d1be84a0206}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
      <rule key="{b488948e-f3c5-42ac-a968-63c0dc6c9006}" filter="ELSE">
        <settings calloutType="simple">
          <text-style isExpression="1" fontSizeUnit="Point" legendString="Aa" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" fontSize="10" fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Open Sans" textOrientation="horizontal" tabStopDistanceUnit="Point" namedStyle="Bold" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" forcedBold="0" fontWeight="75" tabStopDistance="80" useSubstitutions="0" forcedItalic="0" fontKerning="1" fontItalic="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" blendMode="0" capitalization="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontWordSpacing="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferDraw="0" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferNoFill="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskJoinStyle="128" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskSize2="1.5" maskOpacity="1"/>
            <background shapeBorderWidthUnit="Point" shapeDraw="0" shapeRotation="0" shapeSizeX="2" shapeOpacity="1" shapeSizeY="2" shapeRadiiY="4" shapeRadiiUnit="Point" shapeBlendMode="0" shapeRadiiX="4" shapeOffsetX="0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeBorderColor="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" shapeOffsetY="-1.5" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSVGFile="" shapeOffsetUnit="Point" shapeBorderWidth="1" shapeType="0" shapeRotationType="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0">
              <symbol clip_to_extent="1" type="marker" is_animated="0" name="markerSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="145,82,45,255,rgb:0.56862745098039214,0.32156862745098042,0.17647058823529413,1" type="QString" name="color"/>
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
              <symbol clip_to_extent="1" type="fill" is_animated="0" name="fillSymbol" alpha="1" force_rhr="0" frame_rate="10">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255,rgb:1,1,1,1" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" type="QString" name="outline_color"/>
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
            </background>
            <shadow shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6" shadowDraw="0" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetGlobal="1"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" wrapChar="" multilineAlign="0" leftDirectionSymbol="&lt;" placeDirectionSymbol="0" formatNumbers="0" autoWrapLength="0" decimals="3" plussign="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0"/>
          <placement placement="2" overrunDistance="0" distUnits="Point" maxCurvedCharAngleIn="25" lineAnchorTextPoint="FollowPlacement" repeatDistanceUnits="MM" maximumDistanceUnit="MM" priority="5" lineAnchorClipping="0" dist="5" fitInPolygonOnly="0" offsetUnits="MM" centroidWhole="0" geometryGeneratorEnabled="0" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidInside="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overlapHandling="PreventOverlap" repeatDistance="0" prioritization="PreferCloser" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" layerType="LineGeometry" geometryGenerator="" allowDegraded="0" xOffset="0" lineAnchorType="0" maxCurvedCharAngleOut="-25" rotationAngle="0" overrunDistanceUnit="MM" preserveRotation="1" maximumDistance="0" placementFlags="10" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" polygonPlacementFlags="2"/>
          <rendering limitNumLabels="0" minFeatureSize="0" scaleMin="0" zIndex="0" obstacleType="1" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" scaleMax="0" obstacleFactor="1" drawLabels="1" upsidedownLabels="0" fontLimitPixelSize="0" fontMinPixelSize="3" obstacle="1" scaleVisibility="0" unplacedVisibility="0" mergeLines="0"/>
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
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{82bfd6fa-1730-455e-ab3f-125fb38a4d05}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
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
      </rule>
    </rules>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>1</layerGeometryType>
</qgis>
