/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : CaseService
 * Author          : <Amit>
 * Created Date    : Mar 4, 2026
 * Last Modified By: <Amit>
 * Last Modified On: Mar 4, 2026
 * Description     : This class implements for calculating Case SLA Deadline
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Mar 4, 2026  │ <Amit>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class CaseService {
	public static void calculateSLADeadline(List<Case> caseList) {
		for(Case cs : caseList){
			Integer SLADeadline = 0;
			if(cs.Priority != null){
				if(cs.Priority == 'High'){
					SLADeadline += 4;
				}else if(cs.Priority == 'Medium'){
					SLADeadline += 12;
				}else{
					SLADeadline += 24;
				}
				cs.SLA_Deadline__c = System.now().addHours(SLADeadline);
			}
		}
		System.debug('caseList 33 : '+caseList);
	}

}