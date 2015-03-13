<div id="task" class="task candybox">
  <div class="task_header_area viewerHeader">
    <h1>${taskDescriptor.label}</h1>
  </div>
  <div id="task_input_area">
    <div class="header queryHeader viewerHeader">
      <h1>Parameters</h1>
    </div>
    
    <g:if test="${taskDescriptor.serviceName.toString() == 'IES'}"><!-- information text for ies @author junia schoch at fhnw ch -->
    <div style="padding:15px;">
    	<p style="color:red;">Due to backend problems the searching time range for the queries is limited from 2002-01-01 until 2002-02-28.</p>
    </div>
    </g:if>
    
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
          <%-- IesEvent list Selection Area, @author junia schoch at fhnw ch --%>
          <g:if test="${taskDescriptor.inputParams?.iesEventList}">
            <g:render template="/inputParams/iesGenericSummary" model="[paramName : 'IesEventList', title : 'Select an Event List', step:step, paramDroppableName:'', cssParamName: 'EventList']" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- Instrument list Selection Area --%>
          <g:if test="${taskDescriptor.inputParams?.instruments}">
            <g:render template="/inputParams/genericSummary" model="[paramName : 'Instrument', title : 'Select an Instrument', step:step, paramDroppableName:'']" />
            <g:set var="step" value="${step+1}"/>
          </g:if>
          <%-- IesInstrument list Selection Area, @author junia schoch at fhnw ch --%>
          <g:if test="${taskDescriptor.inputParams?.iesInstruments}">
            <g:render template="/inputParams/iesGenericSummary" model="[paramName : 'IesInstrument', title : 'Select an Instrument', step:step, paramDroppableName:'', cssParamName : 'Instrument']" />
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
      <g:render template="/dialog/addItemDataCartDialog"/>
    </div>
  </div>
  <div id="task_result_area">
  </div>
</div>