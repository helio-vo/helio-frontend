<div id="task" class="task candybox">
  <div class="task_header_area viewerHeader">
    <h1>${taskDescriptor.label}</h1>
  </div>
  <div id="task_input_area">
    <div class="header queryHeader viewerHeader">
      <h1>Upload</h1>
    </div>
    <div class="task_input_params task_body">
      <g:form controller="voTable" action="asyncUpload" method="post" name="upload2Form" enctype="multipart/form-data"> 
          <input id="service_name" name="serviceName" type="hidden" value="upload2"/>
          <input id="task_name" name="taskName" type="hidden" value="task_upload2"/>
          <input id="task_label" type="hidden" value="Upload2"/>
          <!--  File to upload: <input type="file" name="fileInput"/>-->
          
          <input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
 
		  <div class="file_input_div">
		  	<input type="button" value="Browse" class="file_input_button menu_item ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" />
		  	<input type="file" name="fileInput" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
		  </div>
          
          <div id="btn_upload" >Upload</div>
          
          <div id="msg_upload"></div>   
      </g:form>
    </div>
  </div>
  <div id="task_result_area">
  </div>
</div>

