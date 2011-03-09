function ActionViewer(imageParam,typeParam,actionNameParam,contentParam,labelParam) {

    // Private variable
    //console.log("HelioElement created "+ imageParam);
    var className = "ActionViewer";
    var actionName = actionNameParam;
    var type = typeParam;
    var content = contentParam;
    var imagePath = imageParam;
    var label = labelParam;
    var resulthtml;
    var prevData;
    var printKey;
    var step =0;
    var history = new Array();


    // Private method
    var unserialize = function(formData){
        $("#currentDisplay").find("select").find("option").removeAttr("selected");
        var fields = formData.split("&");
                    for(field in fields){
                        //console.log(fields[field]);
                        var tempField= fields[field];
                        //minDateList=2003-01-01T07%3A49%3A00%2C2003-01-02T04%3A41%3A00%2C2003-01-02T12%3A58%3A00
                        if(tempField.indexOf("minDateList=")!= -1){
                            tempField =tempField.replace('minDateList=',"");
                            tempField =tempField.replace('%3A',":");
                            tempField =tempField.replace('%2C',",");
                            tempField =tempField.replace('+',"");
                            $(".minDateList").val(tempField);
                        }//end if
                        else if(tempField.indexOf("maxDateList=")!= -1){
                            tempField =tempField.replace('maxDateList=',"");
                            tempField =tempField.replace('%3A',":");
                            tempField =tempField.replace('%2C',",");
                            tempField =tempField.replace('+',"");
                            $(".maxDateList").val(tempField);
                        }//end if

                        else if(tempField.indexOf("minDate=")!= -1){
                            tempField =tempField.replace('minDate=',"");
                            $("#currentDisplay").find("input[name='minDate']").val(tempField);
                        }//end if
                        else if(tempField.indexOf("maxDate=")!= -1){
                            tempField =tempField.replace('maxDate=',"");
                            $("#currentDisplay").find("input[name='maxDate']").val(tempField);
                        }//end if
                        else if(tempField.indexOf("extra=")!= -1){
                            tempField =tempField.replace('extra=',"");
                            $("#currentDisplay").find("select").find("option[value='"+tempField+"']").attr("selected","selected");


                        }else if(tempField.indexOf("where=")!= -1){
                            tempField =tempField.replace('where=',"");
                            tempField =tempField.split("%3B");
                            for(input in tempField){
                                var innerTempField = tempField[input].split("%2C");
                                var value = innerTempField[1];
                                innerTempField = innerTempField[0].split(".");
                                var inputName= innerTempField[0];
                                var labelName = innerTempField[1];
                                //console.log("inputName:"+inputName + " labelName:"+labelName+" value:"+value);

                                $("#currentDisplay").find("label:contains('"+labelName+"')").parent("li").find("input").val(value);
                            }//end input
                        }//end if
                    }//end fields
        
    };

    return {
        // Public methods
     getClassName: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: getClassName");
            return className;
        },
         prepareStep: function(formData) {
             if (typeof console!="undefined")console.info("ActionViewer :: prepareStep ->"+ formData);
            this.prevData=formData;
        },

        addStep: function(result) {
            if (typeof console!="undefined")console.info("ActionViewer :: addStep -> notshown");
          
            var object = new Object();
            object['result']=result;
            object['formData']=this.prevData;
            history.push(object);
            step = history.length -1;
            
            
            
        },
        nextStep: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: nextStep");
            if(step < history.length -1){
                step++;
                
                this.renderContent();
            }
        },
        prevStep: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: prevStep");
            if(step > 0){
                step--;
                
                this.renderContent();
            }
            
        },
        setLabel: function(labelParam) {
            if (typeof console!="undefined")console.info("ActionViewer :: setLabel -> " +labelParam);
            label=labelParam;
            
        },
        getLabel: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: getLabel");
            return label;
        },
        

        setImagePath: function(path) {
            if (typeof console!="undefined")console.info("ActionViewer :: setImagePath -> " +path);
            imagePath = path;
        },
        getImagePath: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: getImagePath");
            return imagePath;
        },
        setContent: function(contentParam) {
            if (typeof console!="undefined")console.info("ActionViewer :: setContent -> " +contentParam);
            content = contentParam;
        },
        getContent: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: getContent");
            return content;
        },

        getType: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: getType -> " + type);
            return type;
        },
        setType: function(typeParam) {
            if (typeof console!="undefined")console.info("ActionViewer :: setType -> " +typeParam);
            type =typeParam;
        },
        renderContent: function() {
            if (typeof console!="undefined")console.info("ActionViewer :: renderContent");
            //console.log("rendering content " + step );
            
            window.workspace.setDisplay(actionName);
            $("#currentDisplay").find("#counter").text((step+1)+"/"+history.length);
            $("#currentDisplay").find("#label").val(label);
            if(history.length <= 0)return;
            var result = history[step].result;
            var formData = history[step].formData;

            unserialize(formData);

            $("#responseDivision").html(result);
            $('.resultTable').each(function(){

              fnFormatTable(this.id);

            });
    
            $('#displayableResult').append($('#tables'));


            $('#displayableResult').css("display","block");
            fnInitSave();
            $("#currentDisplay").find("#forward").click(function(){ window.workspace.getElement().nextStep() });
            
            
            $("#currentDisplay").find("#backward").click(function(){ window.workspace.getElement().prevStep() });
            $("#currentDisplay").find("#delete").click(function(){window.historyBar.removeCurrent()});
            $("#currentDisplay").find("#label").change(function() {
                   window.historyBar.getCurrent().setLabel($(this).val());
                   window.historyBar.render(1);
               });
             
               
               
               
               


               
               


                

            $("#responseDivision").html("");
        },
        render: function(key) {
            if (typeof console!="undefined")console.info("ActionViewer :: render ->"+ key);
            //printKey = key;

            if(history.length <= 0){
                
                // console.log("rendering wild ghost");
                var div = $("<div class='floaters'></div>");
                var img =   $( "<img alt='" +"image missing"+"' class='ghost'  />" ).attr( "src",imagePath );
                div.append(img);
              if(label != null)div.append("<div class='customLabel'>"+label+"</div>");
                $("#historyContent").append(div);
                type="ghost";
            } else{
                // console.log("im at query");
                
                
                div = $("<div class='floaters'></div>");
                img =   $( "<img alt='" +"image missing"+"'   />" ).attr( "src",imagePath );
                div.append(img);
                 if(label != null)div.append("<div class='customLabel'>"+label+"</div>");
                $("#historyContent").append(div);
                type="solid";

                div.dblclick(function() {
                    if (typeof console!="undefined")console.info("ActionViewer :: item doubleclicked ->"+ key);
                    window.historyBar.cleanGhost();
                    //var item = window.historyBar.getItem(key);
                    window.historyBar.setFocus(key);
                    
                    
                    

                  
                    

                });//end dbclick




            }



          
           
           

        }

    };
}