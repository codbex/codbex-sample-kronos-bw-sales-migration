import { Controller, Post, response } from "sdk/http"
import { process } from "sdk/bpm"

@Controller
class ProcessService {

    @Post("/processes/sls_mp")
    public startProcess(parameters: any) {
        const processKey = 'sls_mp';
        const businessKey = 'sls_mp_bk';
        const params = parameters ? parameters : {};
        const processInstanceId = process.start(processKey, businessKey, params);

        response.setStatus(response.ACCEPTED);
        return {
            processInstanceId: processInstanceId,
            processKey: processKey,
            parameters: params,
            message: `Started process instance with id [${processInstanceId}] for process with key [${processKey}]`
        };
    }

}
