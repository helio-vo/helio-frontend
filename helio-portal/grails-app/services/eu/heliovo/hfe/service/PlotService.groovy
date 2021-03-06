package eu.heliovo.hfe.service

import eu.heliovo.registryclient.ServiceCapability;

import java.util.concurrent.TimeUnit

import org.springframework.beans.BeanWrapper
import org.springframework.beans.BeanWrapperImpl

import eu.heliovo.clientapi.HelioClient
import eu.heliovo.clientapi.workerservice.HelioWorkerServiceHandler
import eu.heliovo.hfe.model.result.RemotePlotResult
import eu.heliovo.hfe.model.task.Task
import eu.heliovo.hfe.utils.BeanPopulationUtil;
import eu.heliovo.registryclient.AccessInterface
import eu.heliovo.registryclient.AccessInterfaceType
import eu.heliovo.registryclient.ServiceCapability
import eu.heliovo.registryclient.impl.AccessInterfaceImpl
import eu.heliovo.shared.props.HelioFileUtil

class PlotService {

    def helioClient

    static transactional = true

    /**
     * Execute the plotting service and get back the results.
     * @param task the task to execute. The results will be stored to the task.
     * @return a map containing the results, ready to be passed to the view.
     */
    def plot(Task task) {
        //get the task descriptor
        def taskDescriptor = task.findTaskDescriptor()
        
        def plotService = helioClient.getServiceInstance(
            taskDescriptor.serviceName,
            taskDescriptor.serviceVariant,
            taskDescriptor.serviceCapability)
        
        BeanPopulationUtil.populateService(plotService, task);
        
        // create the models for the template
        def model = [:]
        model.plotResults = []
        model.userLogs = []

        def result = plotService.execute();
        try {
            def resultObject = result.asResultObject(taskDescriptor.timeout, TimeUnit.SECONDS);
            
            // wrap the resultObject ...
            def beanWrapper = new BeanWrapperImpl(resultObject)
            
            // ... and add the results to the task
            taskDescriptor.outputParams.each {
    //            if (it.value.type == "votable") {   // does not apply for plot. keeping it for the one and only super service.
    //                // get the url and wrap into votable object
    //                def url = beanWrapper.getPropertyValue(it.value.id)
    //                def votable = new RemoteVOTableResult(url: url);
    //                votable.save()
    //                task.outputParams.put(it.value.id, votable)
    //                model.votableResults.push ([id: it.value.id, label: it.value.label, value : votable])
    //            }  else 
                if (it.value.type == "url"){
                    def url = beanWrapper.getPropertyValue(it.value.id)
                    def plot = new RemotePlotResult(url : url.toString())
                    plot.save()
                    task.outputParams.put(it.value.id, plot)
                    model.plotResults.push ([id: it.value.id, label: it.value.label, url : plot.url])
                }
            }
            // update task status
            task.lastKnownStatus = HelioWorkerServiceHandler.Phase.COMPLETED
            task.save()
            model.status = "Data successfully loaded!"
        } catch (Exception e) {
            model.status = "Exception while loading data: " + e.getMessage() + ". Check the logs for more information."
            model.error = e.getClass();
        } finally {
            model.userLogs = result.userLogs
        }
        // return the model
        model
    }
}
