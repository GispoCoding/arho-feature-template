<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Labeling" labelsEnabled="1" version="3.40.7-Bratislava">
  <renderer-v2 referencescale="-1" forceraster="0" type="RuleRenderer" symbollevels="0" enableorderby="0">
    <rules key="{178e2009-9047-4176-9ebc-9cb596008dd4}">
      <rule filter="ELSE" key="{20217ee9-52c5-4098-aa4b-45f239e12a1c}" symbol="0"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('tie')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'tie') IS NULL" label="Nykyinen tie" key="{67098b2b-c7b1-4727-bd83-4d2a5febcd08}" symbol="1"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('moottoriTaiMoottoriliikenneTie')" label="Moottori- tai moottoriliikennetie" key="{71233534-3647-4254-ab4e-2187e3ab0742}" symbol="2"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kaksiajoratainenTieTaiKatu')&#xa;" label="Kaksiajoratainen tie tai katu" key="{903c9f98-cd42-4ffd-83d5-a079d3fcc05b}" symbol="3"/>
      <rule filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('kantatie', 'valtatie')" label="Valtatie tai kantatie" key="{6101e3f2-3657-494a-ba45-850bbbc7fd1a}" symbol="4"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('valtatie')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'valtatie') IS NULL" label="Valtatie" key="{7fd7f716-8a76-48fb-a7f9-c76001237174}" symbol="5"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kantatie')" label="Kantatie" key="{d0c7fc7b-9ff1-49cf-aab4-75aada06ccaf}" symbol="6"/>
      <rule filter="array_sort(map_akeys(&quot;type_regulations&quot;)) = array('paakatu', 'seututie')" label="Seututie tai pääkatu" key="{44525622-070c-4471-a3a7-46f008ba8620}" symbol="7"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('seututie')" label="Seututie" key="{6a34abbc-f383-4161-a5af-abe469946ddc}" symbol="8"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('paakatu')" label="Pääkatu" key="{792a7b80-beaf-4c1d-a197-5203a90c62c1}" symbol="9"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('yhdystie')" label="Yhdystie" key="{7b22538e-f2b4-4311-ba19-8bcb222a154a}" symbol="10"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('raideliikenteenAlue')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'raideliikenteenAlue') IS NULL" label="Rautatie" key="{a98bce27-0290-4dfb-858f-073cc2c872c4}" symbol="11"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('paarata')" label="Päärata" key="{8f4efa89-4f16-4b9e-959c-3c678ce4eb9a}" symbol="12"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('yhdysrata')" label="Yhdysrata" key="{e036841f-7968-4755-bbaf-2eccc1895778}" symbol="13"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('sivurata')" label="Sivurata" key="{b78e78f6-b84a-46df-98e1-95f765d962b0}" symbol="14"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kaupunkirata')" label="Kaupunkirata" key="{0603add6-11ca-428e-a0d4-fbef5c3ee594}" symbol="15"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('liikennetunneli')" label="Liikennetunneli" key="{37891b3d-4865-41ad-82fa-aa03f5727092}" symbol="16"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('moottorikelkkailureitti')" label="Moottorikelkkailureitti" key="{30a4ce73-39f2-4b3d-94e5-77d9ce2bb7fb}" symbol="17"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('laivavayla')" label="Laivaväylä" key="{44e49c43-0c54-4c38-9e16-1d5c5f43a5c2}" symbol="18"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('venevayla')" label="Veneväylä" key="{620ed046-20ad-41cc-a218-22ec1828c84b}" symbol="19"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('lossiTaiLauttaYhteys')" label="Lossi- tai lauttayhteys" key="{f60df711-5cc6-4c66-93d5-75524ce4a506}" symbol="20"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'olemassaOleva')" label="Nykyinen tie - olemassa oleva" key="{5e62f549-e28d-400b-98be-6cce6338161e}" symbol="21"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'uusi')" label="Uusi tie" key="{5eb48288-6088-4741-a782-c8332c4ac895}" symbol="22"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'merkittavastiParannettava')" label="Uusi tie" key="{43fc452b-c793-40d4-a03b-5d4cccba7a1d}" symbol="23"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'olemassaOleva')" label="Valtatie - olemassa oleva" key="{ff18458f-6403-4ed1-8477-c3341ad5b4c2}" symbol="24"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'uusi')" label="Uusi valtatie" key="{89ab51ca-9860-4610-a4bb-4696907e941e}" symbol="25"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'merkittavastiParannettava')" label="Merkittävästi parannettava valtatie" key="{29b8e7aa-0354-4d55-a108-0e66af591a3c}" symbol="26"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'tie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'tie')), 'yhteystarve')" label="Tieliikenteen yhteystarve" key="{23054690-65d4-45e7-a5c6-42843ee054ea}" symbol="27"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'yhteystarve')" label="Valtatien yhteystarve" key="{6251c84e-c449-487c-81c7-ed638d6a2cd9}" symbol="28"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'ohjeellinenSijainti')" label="Ohjeellinen valtatie" key="{f7d6210b-b460-467d-b9ff-dbbdc8ba9da2}" symbol="29"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'vaihtoehtoinen')" label="Vaihtoehtoinen valtatie" key="{38105b36-b91a-4a72-8e13-c3f620ff5421}" symbol="30"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'raideliikenteenAlue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'raideliikenteenAlue')), 'yhteystarve')" label="Raideliikenteen yhteystarve" key="{1f55ab69-7e60-4a63-94cc-1b83d6b6458b}" symbol="31"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'joukkoliikenteenAlue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'joukkoliikenteenAlue')), 'kehitettava')" label="Joukkoliikenteen kehittämiskäytävä" key="{84e0192a-04c2-4529-8cbc-f434616051cf}" symbol="32"/>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'jalankulkualue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')), 'yhteystarve')&#xa;AND&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'pyorailyalue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')), 'yhteystarve')" label="Jalankulun ja pyöräilyn yhteystarve" key="{65e1875c-e1b4-4dfe-acf0-947c78eff78f}" symbol="33"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('jalankulkualue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')) = array('yhteystarve')" label="Jalankulun yhteystarve" key="{31db06af-f599-457a-b7ce-06b8433cc5ca}" symbol="34"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('pyorailyalue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')) = array('yhteystarve')" label="Pyöräilyn yhteystarve" key="{be570d05-afb3-42d8-ac59-3a5ed1c1600c}" symbol="35"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('viheryhteys')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'viheryhteys') IS NULL" label="Viheryhteys" key="{fa229435-2ad4-4b8f-a334-b3effc7a53c0}" symbol="36"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('viheryhteys')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'viheryhteys')) = array('yhteystarve')" label="Viheryhteystarve" key="{6077dce3-b7c5-46e2-a096-dc76c43fca4c}" symbol="37"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'sahkolinja') IS NULL" label="Sähkölinja" key="{874ed9d8-89f9-4c73-a4f8-373cd066112d}" symbol="38"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari') IS NULL" label="Vesijohto tai viemäri" key="{6644aed6-61f7-46f7-94f6-b154c7186dc2}" symbol="39"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'kaasulinja') IS NULL" label="Kaasulinja" key="{6274e6f7-0236-49a2-a434-97fe984faebb}" symbol="40"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('uusi')" label="Uusi sähkölinja" key="{202bbd74-afd1-4045-bb53-5ab5f90b0cfa}" symbol="41"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('uusi')" label="Uusi vesijohto tai viemäri" key="{b0f66703-7f3c-4fff-a9ea-9f62faeb1d0f}" symbol="42"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('uusi')" label="Uusi kaasulinja" key="{f8275de9-3676-4d13-8562-85c9f444baef}" symbol="43"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('yhteystarve')" label="Sähkölinjan yhteystarve" key="{3f0060c1-1911-4c66-b36e-bdcdff2f7e9d}" symbol="44"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('yhteystarve')" label="Vesijohdon tai viemärin yhteystarve" key="{21f000d1-7099-4e51-9685-39e73e6aaed6}" symbol="45"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('yhteystarve')" label="Kaasulinjan yhteystarve" key="{2bca7222-658a-472a-b5ef-7923b0e9bc53}" symbol="46"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('historiallinenKohde')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'historiallinenKohde') IS NULL" label="Historiallinen tie" key="{0236b4c3-7fc6-4478-acbd-dec99c141f86}" symbol="47"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti') IS NULL" label="Ulkoilu- tai virkistysreitti" key="{41f233b8-d959-4cce-a00e-fbe5d40910a8}" symbol="48"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti')) = array('uusi')" label="Uusi ulkoilu- tai virkistysreitti" key="{d5652e83-42d2-4615-a2ad-53b855bb3182}" symbol="49"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('ulkoiluTaiVirkistysReitti')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'ulkoiluTaiVirkistysReitti')) = array('yhteystarve')" label="Ulkoilu- tai virkistysreitin yhteystarve" key="{c62c9297-0f9a-46cf-9e48-9e77385b9e7a}" symbol="50"/>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'],&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)" label="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö" key="{f163734d-0d48-4b8a-8ad1-91a8d908de7a}" symbol="51"/>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'natura2000VerkostonAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['natura2000VerkostonAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" label="Natura 2000 -verkostoon kuuluva alue" key="{4d0bd845-1b4c-4785-a671-21d154a1f647}" symbol="52"/>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" label="Luonnon &#xa;monimuotoisuuden kannalta erityisen tärkeä alue" key="{2f802cb9-1fcf-41ca-a746-185b562f22d5}" symbol="53"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('yhdyskuntarakenteenLaajenemissuunta')" label="Yhdyskuntarakenteen laajenemissuunta" key="{1c73678f-9182-4917-91ac-d3be82a21409}" symbol="54"/>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('kehittamisvyohyke')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'kehittamisvyohyke')) = array('yhteystarve')" label="Liikenteen yhteystarve" key="{46e91e2d-23d2-4412-b4a2-f7fbaeab1f4a}" symbol="55"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="0" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{bff5a665-c20a-4b9c-8fe9-d41b7e19539f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="45" name="hash_angle"/>
            <Option type="QString" value="1" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="2" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="MM" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@0@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{5ddeaaf4-9263-4cf3-bf10-9622178b4a1f}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="221,35,35,255,rgb:0.8666666666666667,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="1" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="10" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="3" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="11" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="5" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@11@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.5" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="12" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="5" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@12@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.5" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="13" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="5" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@13@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.5" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="14" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="5" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@14@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.5" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="15" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{e8e74edc-9f4c-4872-952a-71dc3d78f6ae}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="5" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@15@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.5" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="16" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{5c39f1f5-4b0b-4be7-a2b6-13b41c7167d5}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="90" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="15" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="1.9" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@16@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8d9ec6c7-5d58-40dc-bb74-01bf746b0802}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="2" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="HashLine" locked="0" id="{751c1e16-d2fe-467e-af1e-d3f52fffc4bb}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="90" name="hash_angle"/>
            <Option type="QString" value="3" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="MM" name="hash_length_unit"/>
            <Option type="QString" value="15" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="-1.9" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@16@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{25a29b12-86f5-45d4-808b-451b0058b8c7}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="2" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="17" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="HashLine" locked="0" id="{8f2a7c15-775f-49ec-bb29-8a6c014f884a}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="90" name="hash_angle"/>
            <Option type="QString" value="5" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="Point" name="hash_length_unit"/>
            <Option type="QString" value="10" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="-3" name="offset"/>
            <Option type="QString" value="3" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@17@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{0c095a22-8dd9-4e65-9784-4bc178f6ce8e}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="HashLine" locked="0" id="{dd88cfd4-0cde-43d0-b51b-602719f8af27}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="90" name="hash_angle"/>
            <Option type="QString" value="5" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="Point" name="hash_length_unit"/>
            <Option type="QString" value="10" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="3" name="offset"/>
            <Option type="QString" value="3" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@17@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{8d1da158-9c47-4089-ae61-34550acf3a95}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
        <layer pass="0" class="HashLine" locked="0" id="{c7fcb617-7ccd-4853-9b09-e7ede2a2b5e8}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="0" name="hash_angle"/>
            <Option type="QString" value="5" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="Point" name="hash_length_unit"/>
            <Option type="QString" value="10" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@17@2" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{ff95c9f2-daff-4264-b75f-490a7caeb416}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="18" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="13" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@18@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{2abfdf4f-4a9a-45e5-9bbe-e4aa29c087c5}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="19" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="15" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@19@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
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
        </layer>
        <layer pass="0" class="HashLine" locked="0" id="{0d357d8a-d521-453e-92ba-f5b974037921}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="90" name="hash_angle"/>
            <Option type="QString" value="8" name="hash_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
            <Option type="QString" value="Point" name="hash_length_unit"/>
            <Option type="QString" value="15" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="7" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@19@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" locked="0" id="{a75de32d-2071-4543-896a-cd329adc0907}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="Point" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1" name="line_width"/>
                <Option type="QString" value="Point" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="2" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{25c4fb42-15ec-424f-997d-3fbfcd0d24da}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="-2.5" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{61e84333-9081-418c-9840-8a0bedf23d3d}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="2.5" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{713ea345-8053-41b3-bd94-bfab2ee2b903}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="20" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{8f748a90-fa04-4d9f-a1b7-35450d03ace7}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="13" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@20@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{dc1bd9e5-d02e-4e8f-bfbc-f5f542fbcc7f}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
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
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{2abfdf4f-4a9a-45e5-9bbe-e4aa29c087c5}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="21" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="22" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="23" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{358cf78f-0827-4563-90a2-287dcc41d797}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2.25" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="24" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="25" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="26" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="Point" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{358cf78f-0827-4563-90a2-287dcc41d797}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2.25" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="27" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@27@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@27@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@27@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="28" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@28@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@28@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@28@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="29" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@29@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="3" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="15" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@29@0@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="3" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{68b416ff-0f22-4a27-95a1-c4546fc5f21f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="3" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="3" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{7f1e5810-df05-4546-aa14-23b5373f1844}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="3" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="-3" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="30" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@30@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="0.5" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@30@0@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="31" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{be35e3da-0861-4706-908f-d2ac57c7331b}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="@geometry" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@31@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{df7b1142-8c98-4ffe-9245-df391b5cc6ac}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="MM" name="average_angle_unit"/>
                <Option type="QString" value="0" name="hash_angle"/>
                <Option type="QString" value="3" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="MM" name="hash_length_unit"/>
                <Option type="QString" value="5" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval|LastVertex|FirstVertex" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@31@0@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{8ece23c8-3575-4aab-82ae-f29f412552e6}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="1.5" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
        <layer pass="0" class="SimpleLine" locked="0" id="{583d8817-83d0-4417-a21c-bc8a0f5962c3}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="2" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="2" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_end_unit"/>
            <Option type="QString" value="2" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="Point" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="ArrowLine" locked="0" id="{61921724-1c3f-41d4-b76c-2b6311851808}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="1" name="arrow_width"/>
            <Option type="QString" value="MM" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@31@2" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{453c2540-89fc-4a30-af74-a6ecefb378f9}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="32" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@32@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@32@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@32@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="33" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@33@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@33@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@33@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="34" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@34@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@34@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@34@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="35" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@35@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@35@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@35@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="36" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{93c298c0-123a-4d08-9582-9e409d858110}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="7" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@36@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{1c9e73ae-d42d-4bae-a385-2d99a32d32f9}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="213,180,60,255,rgb:0.83529411764705885,0.70588235294117652,0.23529411764705882,1" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="37" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{93c298c0-123a-4d08-9582-9e409d858110}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="7" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@37@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{1c9e73ae-d42d-4bae-a385-2d99a32d32f9}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="213,180,60,255,rgb:0.83529411764705885,0.70588235294117652,0.23529411764705882,1" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="38" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="39" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="4" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="40" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="41" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="42" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="43" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{a1f5798e-b1ac-4301-a01c-4d2d9586ad2f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="44" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="4" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@44@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@44@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="4" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@44@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="1" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="45" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="4" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@45@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@45@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="4" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@45@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="1" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="46" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="4" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@46@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@46@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="4" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@46@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="1" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="47" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ad0c838-9845-4e87-88d7-4222d703f5c4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="124,217,204,255,rgb:0.48627450980392156,0.85098039215686272,0.80000000000000004,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="48" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{be582606-510c-4a5f-a69e-01bfa27474ff}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="3" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="MM" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@48@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.5" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="49" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{be582606-510c-4a5f-a69e-01bfa27474ff}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="3" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="MM" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@49@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.5" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="5" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="50" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{644c1d0a-ce9b-4e3a-8e27-3930a6b21a8f}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > (2) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            10,&#xa;            length($geometry) - 8&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@50@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="MarkerLine" locked="0" id="{2d99c1db-caad-4488-af10-7fe52e51b266}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="MM" name="average_angle_unit"/>
                <Option type="QString" value="3" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="MM" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@@50@0@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="{ae6c71f4-836a-4a67-8e8a-ce20728f47e2}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0.5" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
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
            </layer>
          </symbol>
        </layer>
        <layer pass="0" class="ArrowLine" locked="0" id="{9ff3dc2f-4946-4e73-baf9-11d695921d98}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="2" name="head_length"/>
            <Option type="QString" value="MM" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="2" name="head_thickness"/>
            <Option type="QString" value="MM" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@50@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{d31c8c7c-3653-40b7-9cad-9d01be6cbb48}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="35,35,35,0,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,0" name="outline_color"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="51" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{f57eba6b-1712-4eb0-a30d-1cef77422d06}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="1.25" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="52" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="MarkerLine" locked="0" id="{394de993-20d3-4bd0-9c6c-358039a3eb8d}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="4" name="average_angle_length"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
            <Option type="QString" value="MM" name="average_angle_unit"/>
            <Option type="QString" value="3" name="interval"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
            <Option type="QString" value="Point" name="interval_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="0" name="offset_along_line"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_along_line_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="bool" value="true" name="place_on_every_part"/>
            <Option type="QString" value="Interval" name="placements"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="1" name="rotate"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="@52@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleMarker" locked="0" id="{022f2612-398f-4d5f-b472-4f659b787a08}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="Point" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="0.75" name="size"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="53" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{8ecf55d0-a946-461d-9ae9-6f1c30fc5e62}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" name="line_color"/>
            <Option type="QString" value="dash dot" name="line_style"/>
            <Option type="QString" value="1" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="54" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{50275a2d-a0cc-4563-a4bf-a99f2011a7aa}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="5" name="arrow_start_width"/>
            <Option type="QString" value="Point" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="5" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="15" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="7.5" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="0" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@54@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{48d25de5-881f-4d77-8eae-c4fa9a833d07}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="231,113,72,0,rgb:0.90588235294117647,0.44313725490196076,0.28235294117647058,0" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
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
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="55" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="ArrowLine" locked="0" id="{91533b6d-d7a6-450e-8706-eac1f6a25d34}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="1" name="arrow_start_width"/>
            <Option type="QString" value="MM" name="arrow_start_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_start_width_unit_scale"/>
            <Option type="QString" value="0" name="arrow_type"/>
            <Option type="QString" value="0" name="arrow_width"/>
            <Option type="QString" value="Point" name="arrow_width_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="arrow_width_unit_scale"/>
            <Option type="QString" value="10" name="head_length"/>
            <Option type="QString" value="Point" name="head_length_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_length_unit_scale"/>
            <Option type="QString" value="10" name="head_thickness"/>
            <Option type="QString" value="Point" name="head_thickness_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="head_thickness_unit_scale"/>
            <Option type="QString" value="2" name="head_type"/>
            <Option type="QString" value="1" name="is_curved"/>
            <Option type="QString" value="1" name="is_repeated"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="Point" name="offset_unit"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_unit_scale"/>
            <Option type="QString" value="0" name="ring_filter"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="@55@0" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleFill" locked="0" id="{4ca734c4-5a47-4d49-a06a-7509f417212d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="QString" value="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" name="outline_color"/>
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
        </layer>
        <layer pass="0" class="GeometryGenerator" locked="0" id="{622dfad4-c787-40f2-b02a-3acdfb1e35b4}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="CASE&#xa;    WHEN length($geometry) > ( (5 + 2) * 2 ) THEN&#xa;        line_substring(&#xa;            $geometry,&#xa;            (5 + 2),&#xa;            length($geometry) - (5 + 2)&#xa;        )&#xa;    ELSE&#xa;        $geometry&#xa;END&#xa;" name="geometryModifier"/>
            <Option type="QString" value="Point" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@55@1" force_rhr="0" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="HashLine" locked="0" id="{410325a0-e6d3-4692-8772-82224a61351d}" enabled="1">
              <Option type="Map">
                <Option type="QString" value="4" name="average_angle_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="average_angle_map_unit_scale"/>
                <Option type="QString" value="Point" name="average_angle_unit"/>
                <Option type="QString" value="90" name="hash_angle"/>
                <Option type="QString" value="1" name="hash_length"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="hash_length_map_unit_scale"/>
                <Option type="QString" value="Point" name="hash_length_unit"/>
                <Option type="QString" value="12" name="interval"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="interval_map_unit_scale"/>
                <Option type="QString" value="Point" name="interval_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="0" name="offset_along_line"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_along_line_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_along_line_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="Point" name="offset_unit"/>
                <Option type="bool" value="true" name="place_on_every_part"/>
                <Option type="QString" value="Interval" name="placements"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="1" name="rotate"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="@@55@1@0" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleLine" locked="0" id="{98bf797c-2285-4ed3-97b8-1716b341c8c4}" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="Point" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="7" name="line_width"/>
                    <Option type="QString" value="Point" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="Point" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="Point" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="6" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="7" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="7" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="5" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="8" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="5" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="9" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{c1fbaa3b-6edf-46d1-be03-12db49ccc062}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="5" name="line_width"/>
            <Option type="QString" value="Point" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
      <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="line" name="" force_rhr="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" locked="0" id="{caf62504-e233-4f5d-a577-bd90a633f492}" enabled="1">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.26" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
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
  <labeling type="rule-based">
    <rules key="{0e086683-45db-46cd-9a6d-75f92d1cdc44}">
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('liikennetunneli')" key="{4e96cd72-fdd9-4b18-bfff-efcd5310fce0}" description="Liikennetunneli">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="0" shapeBorderWidth="0" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="141,90,153,255,rgb:0.55294117647058827,0.35294117647058826,0.59999999999999998,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="-6" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{bdec80e5-7b98-428d-8f73-2f9193e43c18}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'uusi')&#xa;OR&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'yhteystarve')&#xa;OR&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'ohjeellinenSijainti')&#xa;OR&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'valtatie')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'valtatie')), 'vaihtoehtoinen')&#xa;OR&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'jalankulkualue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')), 'yhteystarve')&#xa;AND&#xa;array_contains(map_akeys(&quot;type_regulations&quot;), 'pyorailyalue')&#xa;AND&#xa;array_contains(map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')), 'yhteystarve')&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('jalankulkualue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'jalankulkualue')) = array('yhteystarve')&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('pyorailyalue')&#xa;AND&#xa;map_akeys(map_get(&quot;type_regulations&quot;, 'pyorailyalue')) = array('yhteystarve')" key="{a79d9092-b110-4479-b1dd-7ce0cd12b166}" description="Red font">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="230,45,43,255,rgb:0.90196078431372551,0.17647058823529413,0.16862745098039217,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="0" shapeBorderWidth="0" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="152,125,183,255,rgb:0.59607843137254901,0.49019607843137253,0.71764705882352942,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="5" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{699cd6a4-daea-4172-94ff-e9f860f6ada5}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'sahkolinja') IS NULL&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari') IS NULL&#xa;OR&#xa;map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;AND&#xa;map_get(&quot;type_regulations&quot;, 'kaasulinja') IS NULL" key="{ba75a71a-7c69-4ebd-985d-316bd4295fc4}" description="Sähkölinja, vesijohto, kaasulinja">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="1" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="3" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="0" shapeBorderWidth="0" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="183,72,75,255,rgb:0.71764705882352942,0.28235294117647058,0.29411764705882354,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0.75" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="-5" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="9" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{f3cd6cb4-4d36-49b5-8197-c1483c454a14}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('sahkolinja')&#xa;    AND&#xa;    (&#xa;        map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('uusi')&#xa;        OR&#xa;        map_akeys(map_get(&quot;type_regulations&quot;, 'sahkolinja')) = array('yhteystarve')&#xa;    )&#xa;)&#xa;OR&#xa;(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('vesijohtoTaiViemari')&#xa;    AND&#xa;&#x9;(&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('uusi')&#xa;&#x9;&#x9;OR&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'vesijohtoTaiViemari')) = array('yhteystarve')&#xa;&#x9;)&#xa;)&#xa;OR&#xa;(&#xa;    map_akeys(&quot;type_regulations&quot;) = array('kaasulinja')&#xa;    AND&#xa;&#x9;(&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('uusi')&#xa;&#x9;&#x9;OR&#xa;&#x9;&#x9;map_akeys(map_get(&quot;type_regulations&quot;, 'kaasulinja')) = array('yhteystarve')&#xa;&#x9;)&#xa;)" key="{9b089a75-4371-4b5b-a380-ca23a1fe003c}" description="Uusi/yhteystarve sähkölinja, kaasulinja tai vesijohto">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="1" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="3" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="0" shapeBorderWidth="0.75" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="255,158,23,255,rgb:1,0.61960784313725492,0.09019607843137255,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="229,31,45,255,rgb:0.89803921568627454,0.12156862745098039,0.17647058823529413,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0.75" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="0" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="9" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{e0161c43-c9d4-4862-8f31-0efb003d8405}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['valtakunnallisestiMerkittavaRakennettuKulttuuriymparisto'],&#xd;&#xa;  'valtakunnallinen'&#xd;&#xa;)" key="{aebd6e87-8b2c-4703-8210-09631328d0f3}" description="Valtakunnallisesti merkittävä rakennettu kulttuuriympäristö">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="10" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="124,217,204,255,rgb:0.48627450980392156,0.85098039215686272,0.80000000000000004,1" bufferJoinStyle="128" bufferSizeUnits="Point"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="15" maskedSymbolLayers="" maskType="0" maskSize="15" maskEnabled="0" maskSizeUnits="Point" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="1" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="2" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="2" shapeBorderWidth="1" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="-1.5" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="133,182,111,255,rgb:0.52156862745098043,0.71372549019607845,0.43529411764705883,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="1" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="2" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{bbd4a37a-a256-427c-9ba4-a5e720e7120b}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'natura2000VerkostonAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['natura2000VerkostonAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" key="{8dd601ab-16e8-4cbe-9d2b-d0b59a137f79}" description="Natura 2000">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="150,150,150,255,rgb:0.58823529411764708,0.58823529411764708,0.58823529411764708,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="128,128,128,131,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,0.51526665140764472" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="1" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="2" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="2" shapeBorderWidth="1" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="-1.5" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="229,182,54,255,rgb:0.89803921568627454,0.71372549019607845,0.21176470588235294,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,131,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,0.51526665140764472" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="1" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="2" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{8c8c7e34-545b-4859-bd2a-5b1daf4a1d9f}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="map_exist(&#xd;&#xa;  &quot;type_regulations&quot;,&#xd;&#xa;  'luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'&#xd;&#xa;)&#xd;&#xa;AND map_exist(&#xd;&#xa;  &quot;type_regulations&quot;['luonnonMonimuotoisuudenKannaltaErityisenTarkeaAlue'],&#xd;&#xa;  'osaAlue'&#xd;&#xa;)" key="{ed78956e-f351-429f-a171-92abad73c5ac}" description="Luonnon monimuotoisuuden kannalta erityisen tärkeä alue">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="0" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="1" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="2" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="2" shapeBorderWidth="0" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="-1.5" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="183,72,75,255,rgb:0.71764705882352942,0.28235294117647058,0.29411764705882354,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="25,104,64,255,rgb:0.09803921568627451,0.40784313725490196,0.25098039215686274,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="1" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="2" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{8a8a75b0-c2d8-4e2e-ab30-7d1be84a0206}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
      <rule filter="ELSE" key="{b488948e-f3c5-42ac-a968-63c0dc6c9006}">
        <settings calloutType="simple">
          <text-style fontLetterSpacing="0" textOpacity="1" multilineHeight="1" useSubstitutions="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" isExpression="1" tabStopDistance="80" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" namedStyle="Bold" fontUnderline="0" fontKerning="1" tabStopDistanceUnit="Point" forcedItalic="0" fontFamily="Open Sans" capitalization="0" blendMode="0" fontSize="10" fontWeight="75" forcedBold="0" fontStrikeout="0" fieldName="array_to_string(&quot;short_names&quot;, '/')" fontWordSpacing="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textOrientation="horizontal" fontItalic="0" multilineHeightUnit="Percentage" textColor="50,50,50,255,rgb:0.19607843137254902,0.19607843137254902,0.19607843137254902,1" allowHtml="0">
            <families/>
            <text-buffer bufferDraw="0" bufferSize="1" bufferNoFill="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="250,250,250,255,rgb:0.98039215686274506,0.98039215686274506,0.98039215686274506,1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
            <text-mask maskJoinStyle="128" maskOpacity="1" maskSize2="1.5" maskedSymbolLayers="" maskType="0" maskSize="1.5" maskEnabled="0" maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeJoinStyle="64" shapeBlendMode="0" shapeSizeY="2" shapeBorderColor="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="4" shapeRotation="0" shapeOffsetX="0" shapeSizeUnit="Point" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="4" shapeSVGFile="" shapeRotationType="0" shapeOffsetUnit="Point" shapeSizeX="2" shapeBorderWidth="1" shapeSizeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="-1.5" shapeBorderWidthUnit="Point" shapeOpacity="1" shapeRadiiUnit="Point">
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="marker" name="markerSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="145,82,45,255,rgb:0.56862745098039214,0.32156862745098042,0.17647058823529413,1" name="color"/>
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
              <symbol clip_to_extent="1" is_animated="0" frame_rate="10" type="fill" name="fillSymbol" force_rhr="0" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" locked="0" id="" enabled="1">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="111,168,218,255,rgb:0.43529411764705883,0.6588235294117647,0.85490196078431369,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="1" name="outline_width"/>
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
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetAngle="135" shadowBlendMode="6" shadowUnder="0" shadowRadius="1.5" shadowOffsetDist="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" decimals="3" multilineAlign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" wrapChar="" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" leftDirectionSymbol="&lt;" addDirectionSymbol="0" plussign="0"/>
          <placement maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" centroidWhole="0" polygonPlacementFlags="2" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" dist="5" geometryGeneratorType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorClipping="0" overrunDistance="0" repeatDistanceUnits="MM" offsetUnits="MM" lineAnchorPercent="0.5" layerType="LineGeometry" overlapHandling="PreventOverlap" lineAnchorTextPoint="FollowPlacement" offsetType="0" rotationAngle="0" geometryGenerator="" overrunDistanceUnit="MM" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maximumDistance="0" fitInPolygonOnly="0" xOffset="0" lineAnchorType="0" placement="2" allowDegraded="0" quadOffset="4" geometryGeneratorEnabled="0" maximumDistanceUnit="MM" placementFlags="10" maxCurvedCharAngleIn="25" centroidInside="0" priority="5" prioritization="PreferCloser" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="Point" maxCurvedCharAngleOut="-25"/>
          <rendering scaleVisibility="0" fontMinPixelSize="3" obstacle="1" scaleMin="0" minFeatureSize="0" upsidedownLabels="0" scaleMax="0" obstacleType="1" drawLabels="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" unplacedVisibility="0" limitNumLabels="0" zIndex="0" fontLimitPixelSize="0" mergeLines="0" fontMaxPixelSize="10000"/>
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
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot; id=&quot;{82bfd6fa-1730-455e-ab3f-125fb38a4d05}&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
      </rule>
    </rules>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>1</layerGeometryType>
</qgis>
