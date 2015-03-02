<%-- 
Template to display the ies instrument selection dialog.
Expected variables:
 * map taskDescriptor
 * InstrumentParam instrument: the instrument parameter
 * Map taskDescriptor: descriptor that describes the task
 
 @author junia schoch at fhnw ch--%>
<div class="input-dialog" id="instrumentDialog" style="display: none">
	<g:set var="paramDescriptor"
		value="${taskDescriptor.inputParams.instruments}" />
	<h3>1. Filter options</h3>
	<div class="accordion">
		<h4>Filter instruments by Observable Entity</h4>
		<div id="observableEntity_filter">
			<table>
				<tr>
					<td width="80" valign="top"><input class="obsEntityPhotons"
						column="10" name="Photons" type="checkbox"> <i>Photons</i></td>
					<td><input class="obsEntityPhotonsType" column="11" name="GMR"
						type="checkbox"> GMR</td>
					<td><input class="obsEntityPhotonsType" column="11" name="HXR"
						type="checkbox"> HXR</td>
					<td><input class="obsEntityPhotonsType" column="11" name="SXR"
						type="checkbox"> SXR</td>
					<td><input class="obsEntityPhotonsType" column="11" name="EUV"
						type="checkbox"> EUV</td>
					<td><input class="obsEntityPhotonsType" column="11" name="UV"
						type="checkbox"> UV</td>
					<td><input class="obsEntityPhotonsType" filterClass="visible"
						column="11" name="Visible" type="checkbox"> Visible</td>
					<td></td>
					<td><input class="obsEntityPhotonsType" column="11"
						name="Microwave" type="checkbox"> &mu;-wave</td>
					<td><input class="obsEntityPhotonsType" column="11"
						name="Radio" type="checkbox"> Radio</td>
				</tr>
				<tr>
					<td width="80"><input class="obsEntityParticles" column="10"
						name="Particles" type="checkbox"> <i>Particles</i></td>
					<td><input class="obsEntityParticlesType" column="11"
						name="Charged" type="checkbox"> Charged</td>
					<td><input class="obsEntityParticlesType" column="11"
						name="Energy" type="checkbox"> Energetic</td>
					<td><input class="obsEntityParticlesType" column="11"
						name="Neut" type="checkbox"> Neutral</td>
					<td><input class="obsEntityParticlesType" column="11"
						name="Dust" type="checkbox"> Dust</td>
				</tr>
				<tr>
					<td width="80"><input class="obsEntityFields" column="10"
						name="Fields" type="checkbox"> <i>Fields</i></td>
					<td><input class="obsEntityFieldsType" column="11"
						name="Elect" type="checkbox"> Electric</td>
					<td><input class="obsEntityFieldsType" column="11" name="Magn"
						type="checkbox"> Magnetic</td>
					<!--
	            elect/magn. <input column="11" name="uv" type="checkbox">
	            -->
					<td><input class="obsEntityFieldsType" column="11"
						name="Gravity" type="checkbox"> Gravity</td>
				</tr>
				<tr>
			</table>
		</div>

		<h4>Filter instruments by Keywords</h4>
		<div id="keywords_filter">
			<table>
				<tr>
					<td><input column="15" name="Imager" type="checkbox">
						Imager</td>
					<td><input column="15" name="Spectrometer" type="checkbox">
						Spectrometer</td>
					<td><input column="15" name="Polarimeter" type="checkbox">
						Polarimeter</td>
					<td><input column="15" name="Coronagraph" type="checkbox">
						Coronagraph</td>
					<td><input column="15" name="Magnetograph" type="checkbox">
						Magnetograph</td>
					<td><input column="15" name="Magnetometer" type="checkbox">
						Magnetometer</td>
				</tr>
				<tr>
					<td><input column="15" name="Oscillations" type="checkbox">
						Oscillations</td>
					<td><input column="15" name="Composition" type="checkbox">
						Composition</td>
					<td><input column="15" name="Irradiance" type="checkbox">
						Irradiance</td>
					<td><input column="15" name="Photometer" type="checkbox">
						Photometer</td>
					<td><input column="15" name="Radiometer" type="checkbox">
						Radiometer</td>
				</tr>
			</table>
		</div>
	</div>
	<h3>2. Select Instruments</h3>
			<div id="instrument_table">
			<div class="filterInstrumentsText">All lists are shown.</div>
			<table id="selectInstrument" class="resultTable">
				<thead>
					<tr>
						<th>Observatory</th>
						<th>Instrument</th>
						<th>Label</th>
						<th>Internal Name</th>
						<th column="3">Observable Entity 1</th>
						<th>Observable Entity 2</th>
						<th>Keywords</th>
					</tr>
				</thead>
				<tbody>
					<g:each
						in="${taskDescriptor.inputParams.iesInstruments.instruments.valueDomain}"
						status="i" var="rows">
						<tr id="selectInstrument_row_${i}" data-isinpat="${rows.isInPat}">
							<td>
								${rows.observatoryName}
							</td>
							<td>
								${rows.name}
							</td>
							<td>
								${rows.label}
							</td>
							<td>
								${rows.value}
							</td>
							<td>
								${rows.instOe1 }
							</td>
							<td>
								${rows.instOe2 }
							</td>
							<td>
								${rows.keywords }
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div align="right">Instruments in red cannot be accessed through HELIO</div>
		</div>
		<h3>3. Provide a name to add this instrument list to your Data Cart</h3>
		<div id="dataCart_name" style="margin-top: 20px;">
			Name: <input tabindex="-1" id="nameInstrument" name="nameInstrument"
				type="text" tabindex="1" value="${instrument.name}" />
		</div>
</div>