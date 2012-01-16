package eu.heliovo.hfe.service

import eu.heliovo.hfe.model.param.ParamSet
import eu.heliovo.hfe.model.param.TimeRangeParam
import eu.heliovo.hfe.model.security.User
import eu.heliovo.hfe.model.task.Task
import eu.heliovo.shared.util.DateUtil
import grails.validation.ValidationException

/**
 * Some service utilities to load default values.
 * @author MarcoSoldati
 *
 */
class DefaultsService {

    static transactional = false

    /**
     * Auto-wire the springSecurityService
     */
    def springSecurityService

    /**
     * Create a TimeRangeParam with default values, but do not store it in the database.
     * @return the default time range.
     * @TODO: move to central utility method.
     */
    def TimeRangeParam createDefaultTimeRange() {
        new TimeRangeParam(DateUtil.fromIsoDate("2003-01-01T00:00:00"), DateUtil.fromIsoDate("2003-01-03T00:00:00"))
    }

    /**
     * Create a new param set instance but do not save it to the database.
     * @param taskName the name of the task this paramSet belongs to.
     * @param params the default params of this set
     * @return the created paramSet
     * @throws ValidationException in case the created params object is not valid.
     */
    def newParamSet(taskName, params) throws ValidationException {
        def paramSet = new ParamSet(params: params, taskName: taskName)
        if (!paramSet.validate()) {
            throw new ValidationException("ParamSet is not valid", paramSet.errors)
        }
        paramSet
    }

    def loadTask(taskName) {
        // load previous task from database
        def user = User.get(springSecurityService.principal.id)
        def task = Task.find("from " + Task.getSimpleName() + " AS t WHERE t.owner=:owner AND t.taskName=:taskName ORDER BY lastUpdated desc", [owner:user, taskName: taskName])

        // create a new temporary task to be used as model
        if (!task) {
            def inputParams = [
                timeRange: createDefaultTimeRange(),
                paramSet: newParamSet(taskName, [longitude:0, width: 45.0, speed : 800, speedError: 0])
            ]
            task = new Task([
                inputParams: inputParams,
                taskName : taskName
            ])
        }
    }
}
