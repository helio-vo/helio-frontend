package eu.heliovo.hfe.controller;

/**
 * Controller to handle error messages
 *
 */
class ErrorsController {

    /**
     * handle page not found exception (delegates to notFound.gsp)
     */
    def notFound = {
        if (request.isXhr()) {
            render view:'notFoundAjax'
        } else {
            render view:'notFound'
        }
    }
    
    
}
