package eu.heliovo.hfe.service

import static org.junit.Assert.assertNotNull;

import java.util.logging.LogRecord;

import net.ivoa.xml.votable.v1.VOTABLE;

import eu.heliovo.clientapi.query.HelioQueryResult
import eu.heliovo.clientapi.query.impl.IesQueryServiceImpl;
import eu.heliovo.clientapi.query.local.LocalQueryResultImpl;

import eu.heliovo.hfe.model.param.EventListParam
import eu.heliovo.hfe.model.param.EventListParamEntry
import eu.heliovo.hfe.model.param.InstrumentParam
import eu.heliovo.hfe.model.result.HelioResult;
import eu.heliovo.hfe.model.task.Task

import eu.heliovo.registryclient.HelioServiceName;
import eu.heliovo.registryclient.ServiceCapability;

import grails.test.GrailsUnitTestCase

class CatalogServiceTests extends GrailsUnitTestCase {
	def catalogService
	def taskDescriptorService
	
	public void setUp() {
		super.setUp()
		
		def iesQueryServiceImpl = new MockIesQueryService()
		
		catalogService = new CatalogService()
		catalogService.setIesQueryServiceImpl(iesQueryServiceImpl)
		
		taskDescriptorService = new TaskDescriptorService()
		taskDescriptorService.taskDescriptor = [
			"ies" :  [
				"label" : "EXPERIMENTAL: Find Observation Data by event/instrument",
				"description" : "EXPERIMENTAL: Find Observation Data by event/instrument",
				"serviceName" : HelioServiceName.IES,
				"serviceCapability" : ServiceCapability.EXPERIMENTAL_QUERY_SERVICE,
				"serviceVariant" : null,
				"timeout" : 120,
				"inputParams" : [
				  "iesInstruments" :  [
					  "instruments" : [label : "Instruments", description : "Name of the Instrument", type : String[],
						  defaultValue : [],
						  valueDomain: null] //instrumentDescriptors]
				  ],
				  "iesEventList" :  [
					  "listNames" : [label : "Event List", description : "Name of the Event List", type : [javaType: String][],
						  defaultValue : [],
						  valueDomain: null] //eventListDescriptors]
					  ],
				  "paramSet" : [:]  /* dynamically populated */
				],
				"outputParams" : [
				  "voTableUrl" : [id : "voTableUrl", label: "VOTable", type : "votable" ],
				]
			]]
		
	}

	public void tearDown() {
		super.tearDown()
	}

	void testQueryIes() {
		def task = new Task()
		task.taskName = "ies"
		task.taskDescriptorService = taskDescriptorService
		
		EventListParamEntry entry = new EventListParamEntry()
		entry.listName = "rhessi_hxr_flare"
		
		EventListParam eventListParam = new EventListParam()
		
		InstrumentParam instrumentParam = new InstrumentParam()
		instrumentParam.instruments = Collections.singletonList("RHESSI__HESSI_HXR")
		
		task.inputParams.put("eventList", eventListParam)
		task.inputParams.put("instruments", instrumentParam)
		def model = catalogService.queryIes(task)
		
		assertNotNull(model)
	}	
	
	/**
	 * Mock for IesQueryServiceImpl that returns a LocalQueryResult.
	 * @author Junia
	 *
	 */
	public class MockIesQueryService extends IesQueryServiceImpl {
		private static final String SAMPLE_VOTABLE = "testdata_dpas_votable.xml";
		
		@Override
		public HelioQueryResult query(List<String> startTime, List<String> endTime, List<String> fromHec,
			List<String> fromIcs, List<String> instruments, int maxRecords, int startIndex) {
		
			HelioQueryResult result = getValidLocalQueryResult()
			return result
		}
			
		private HelioQueryResult getValidLocalQueryResult() {
			List<LogRecord> userLogs = new ArrayList<LogRecord>();
			HelioQueryResult queryResultImpl = new LocalQueryResultImpl(0, userLogs, getTestVOTable());
			return queryResultImpl;
		}
		
		private File getTestVOTable() {
			URL resultFile = getClass().getResource(SAMPLE_VOTABLE);
			assertNotNull("resource not found: " + SAMPLE_VOTABLE, resultFile);
			try {
				return new File(resultFile.toURI());
			} catch (URISyntaxException e) {
				throw new RuntimeException(e);
			}
		}
	}
}
