<%-- Template for the param set summary of iesInstrument and iesEventList
Expected params:
 * Integer step: step number for help text.
 * String paramName : name of the param
 * String cssParamName: name of the additional css class
 * String title
 * @author junia schoch at fhnw ch
 --%><tr>
  <td style="border-top: solid 1px gray;">
    <b><g:message code="input.summary.${paramName}.title" /></b>
    <table style="margin-bottom: 10px;">
      <tr>
        <td valign="top">
          <div class="paramDroppable paramDroppable${paramName} paramDroppable${cssParamName}" style="width: 70px; height: 70px; padding: 0; float: left; margin: 10px;">
            <img id="img${paramName}Summary" class="paramDraggable paramDraggable${paramName} paramDraggable${cssParamName}"  style="margin:11px" src="${resource(dir:'images/helio',file:'circle_' + paramName + '_grey.png')}" />
          </div>
          <div class="contextMenu show${paramName}_ContextDialog" data-type="${paramName}">
          		<ul style="line-height:200%">
					<li class="show${paramName}Dialog">Select new ${paramName}</li>
					<li class="addToDataCard">Add ${paramName } to data cart</li>
				</ul>
				<p>Select ${paramName} from data cart</p>
				<ul class="itemList">
					
				</ul>
          </div>
        </td>
        <td rowspan="2" id="text${paramName}Summary" class="candybox summaryBox showDialog show${paramName}Dialog" >
        </td>
        <td rowspan="2">
           <div class="button${paramName} clear${paramName}Summary">Clear</div>
        </td>
      </tr>
	</table>
  </td>
  <td style="border-top: solid 1px gray; vertical-align: top;">
    <div class="message"><b>Step ${step}</b><br/><g:message code="input.summary.${paramName}.helptext" /></div>
  </td>
</tr>