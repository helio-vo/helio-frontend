package eu.heliovo.hfe.service
import ch.i4ds.helio.frontend.parser.*
import ch.i4ds.helio.frontend.query.*
import eu.heliovo.clientapi.frontend.*

/**
* Class that manages result storage, currently they are all kept in memory using a linkedList.
* TODO: consider moving to StilUtils and using a database. 
*/
class ResultVTManagerService {

    static transactional = false;
    
    private List<ResultVT>  resultList = new LinkedList<ResultVT>();
    private List<String>  resultListServiceRefence = new LinkedList<String>();
    
    public int addResult(ResultVT r,String service){
        this.resultList.add(r);
        this.resultListServiceRefence.add(service);
        return this.resultList.size() -1;
    }
    public ResultVT getResult(int index){
        try{
            return this.resultList.get(index);
        }catch (Exception e){
            return null;
        }
    }
    public String getResultServiceReference(Integer index){
        try{
            return this.resultListServiceRefence.get(index);
        }catch (Exception e){
            return null;
        }
    }
}
