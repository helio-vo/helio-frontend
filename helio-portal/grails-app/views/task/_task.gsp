<div id="task" class="task candybox">
  <div class="task_header_area viewerHeader">
    <h1>${taskDescriptor.label}</h1>
  </div>
  <div id="task_input_area">
    <div class="header queryHeader viewerHeader">
      <h1>Parameters</h1>
    </div>
    <div class="task_input_params task_body">
      <table width="100%" cellpadding="0" cellspacing="0">
        <col width="*" />
        <col width="250"/>
        <tbody>
          <g:set var="step" value="${1}"/>
          <%-- Time Selection Area --%>
          <g:if test="${taskDescriptor.inputParams?.timeRanges}">
            <g:render template="/inputParams/genericSummary" model="[paramName : 'TimeRange', title : 'Select Dates', step:step, paramDroppableName:'']" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- Event list Selection Area --%>
          <g:if test="${taskDescriptor.inputParams?.eventList}">
            <g:render template="/inputParams/genericSummary" model="[paramName : 'EventList', title : 'Select an Event List', step:step, paramDroppableName:'']" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- Instrument list Selection Area --%>
          <g:if test="${taskDescriptor.inputParams?.instruments}">
            <g:render template="/inputParams/genericSummary" model="[paramName : 'Instrument', title : 'Select an Instrument', step:step, paramDroppableName:'']" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- Param Selection Area --%>
          <g:if test="${taskDescriptor.inputParams?.paramSet}">
            <g:render template="/inputParams/genericSummary" model="${[paramName : 'ParamSet', title : 'Select Parameters', step:step, paramDroppableName:task.taskName]}" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- Execute Query area --%>
          <g:render template="/inputParams/performQuery" model="[step:step]" />
          <g:set var="step" value="${step+1}"/>
        </tbody>
      </table>
      <div id="addItemDataCartDialog">
      		<p>There is already a cart item with the name <label for="itemName"></label> in your data cart!</p>
      		<p>What would you like to do next?</p>
      		
      		<div id="accordion">
				<h3>Rename the new item.</h3>
				<div>
					<table>
						<tr>
							<td>Name:</td>
							<td><input name="dataItemName" type="text" value=""/></td>
							
						</tr>
					</table>
					<button class="renameItem button ui-corner-all float-right">Ok</button>
				</div>
				<h3>Overwrite item form the data cart.</h3>
				<div>
					<p>Click on the item to overwrite.</p>
					<div class="sameNameItemList"></div>
				</div>
				<h3>Create a new item with the same name</h3>
				<div>
					<button class="createItem button ui-corner-all float-right">Ok</button>
				</div>
			</div>
      </div>
    </div>
  </div>
  <div id="task_result_area">
  </div>
</div>