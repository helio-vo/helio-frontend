package eu.heliovo.hfe.model.result
import uk.ac.starlink.table.StarTable;
import ch.i4ds.helio.frontend.parser.*
import ch.i4ds.helio.frontend.query.*
import eu.heliovo.clientapi.frontend.*
import eu.heliovo.clientapi.utils.STILUtils;
import eu.heliovo.hfe.model.security.User;

/**
 * Abstract base class for stored VoTables.
 * This can be persisted in a local database.
 * @author MarcoSoldati
 *
 */
abstract class HelioResult {
    /**
     * Transient property of the stil model 
     */
    StarTable[] starTableModel;
    
    /**
     * The user this result belongs to
     */
    User user;
    
    static transients =  ['starTableModel']
        
    static constraints = {
        user nullable : false;
    }
    
    /**
     * Get the star model. This is lazy loaded it if required.
     * @return the starModel the star model to access the stored voTable.
     */
    abstract StarTable[] getStarTableModel();
}
