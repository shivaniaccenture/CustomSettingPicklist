public class Custom_settingsController {
	public String state { get; set; }
    public String city{ get; set;}
    public Map<String, StateCityDetail__c> sclist { get; set; }
    
    public Custom_settingsController(){
        sclist = StateCityDetail__c.getall();
    }
    public List<SelectOption> getCityList(){
		
        list<selectoption> clist = new list<selectoption>();
        clist.add(new selectoption('','--Select--'));
         if(state==null){
            state='';
        }
        else{
            if(sclist.containskey(state)){
                clist.clear();
                string sc = sclist.get(state).City__c;
                for(string sa: sc.split(';'))
                    clist.add(new selectoption(sa,sa));
            }
            
        }
        return clist;
        
    }
    
    public List<SelectOption> getStatelist() {
        List<SelectOption> state = new List<SelectOption>();
        state.add(new selectoption('','--Select--'));
       
        list<string> statename= new list<string>();
        statename.addall(sclist.keyset());
        
        for(string s : statename){
            state.add(new selectoption(s,s));
            
        }
        
        return state;
    } 
}