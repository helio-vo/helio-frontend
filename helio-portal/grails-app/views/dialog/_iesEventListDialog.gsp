<%-- 
Template to display the ies event list selection dialog.
Expected variables:
 * map taskDescriptor
 * EventListParam eventList: the event list parameter
 * Map taskDescriptor: descriptor that describes the task
 
 @author junia schoch at fhnw ch--%>
<div class="input-dialog" id="eventListDialog" style="display:none">
  <g:set var="paramDescriptor" value="${taskDescriptor.inputParams.eventList}" />
  <%--input dialog for eventLists --%>
  <table class="dialog_table">
    <tr valign="top" align="left" height="*">
      <td valign="top" width="90px">
        <div class="paramDroppable" style="width: 70px; height: 70px; padding: 0; float: left; margin: 10px;">
          <img style="margin:11px" src="${resource(dir:'images/helio',file:'circle_EventList.png')}" />
        </div>
      </td>
      <td>
        <p style="margin-bottom: 7px">Select criteria to restrict the list of events</p>
        <table  style="text-align: left;" cellpadding="0" cellspacing="0">
          <col width="10" />
          <col width="100"/>
          <col width="100"/>
          <col width="100"/>
          <col width="100"/>
          <col width="100"/>
          <tr>
            <td></td>
            <td colspan="2"><input id="checkAll" checked="checked" name="everything" type="checkbox"/> Show all</td>
            <td colspan="3"><%--input id="checkTimeRange" checked="checked" name="timeRange" type="checkbox"/> Show instruments active between <span name="startTime"></span> and <span name="endTime"></span> --%></td>
          </tr>
          <tr>
            <td></td>
            <td>Event type:</td>
            <td><input class="checkFilter event" name="CME" title="Coronal Mass Ejection" column="8" type="checkbox" value="true"/> CME</td>
            <td><input class="checkFilter event" name="Flare" title="Flare" title="Flare" column="7" type="checkbox" value="true"/> Flare</td>
            <td><input class="checkFilter event" name="Solar Wind" title="Solar Wind" column="9" type="checkbox" value="true"/> Solar Wind </td>
            <td><input class="checkFilter event" name="Particle" title="Particle" column="8" type="checkbox" value="true"/> Particle</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="3" style="height: 20px;"><span id="filterText">All flare lists are shown.</span>
      <div style="float:right; display:block; font-size: 0.8em;"><b>Search</b> <input id="input_filter" type="text" title="Enter a free search text"></div>
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <table style="width:750">
          <tr>
            <td width="500" valign="top">
              <g:render template="/dialog/_catalogTable" 
                  model="${[tableId: 'selectTableEventList', tableName: 'selectTableEventList', 
                      rowDescriptors: taskDescriptor.inputParams.iesEventList.listNames.valueDomain,
                      columnDescriptors: taskDescriptor.inputParams.iesEventList.listNames.valueDomain[0].beanInfo.propertyDescriptors]}"/>
            </td>
            <td width="250" valign="top">
                <div id="summaryEventList" class="candybox dialog_selection_area"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <%-- label management --%>
    <tr valign="top" align="left" height="20" >
      <td colspan="2" style="padding:5px; border-top:2px solid grey" title="Assign a name to the current event List.">Name: <input tabindex="-1" id="nameEventList" name="nameEventList" type="text" tabindex="1" value="${eventList.name}"/>
      <div class="message" style="display:inline; float:right; margin:0px; padding:3px">Provide a name to add this event list to your <i>Data Cart</i>.</div>
    </tr>
  </table>
</div>