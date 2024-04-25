# Enhancing Oncology Model Inferno Test Kit
This is an Inferno Test Kit for the Enhancing Oncology Model (EOM) FHIR Implementation Guide. It is designed to test 
the structure of FHIR resources against the definitions set forth by the IG. 

The Enhancing Oncology Model (EOM) is a Center for Medicare and Medicaid Innovation (CMMI) (Innovation Center) alternative 
payment model designed to promote high quality, person-centered care, advance health equity, encourage better care coordination, 
improve access to care, reduce costs, and improve outcomes for Medicare fee-for-service (FFS) beneficiaries with cancer who receive 
cancer treatment. EOM builds on lessons from the Oncology Care Model (OCM) and shares certain features with OCM, including 
episode-based payments that financially incentivize physician group practices (PGPs) to improve care and lower costs.

## Available Tests
- **Bundle POST Test:** This test allows users to submit an EOM FHIR Bundle resource using an API platform such as Postman 
via a POST request. The Test Kit will receive the request, then validate the structure of the bundle, as well as the resources
the bundle contains.
- **Bundle Manual Input Test:** This test allows users to submit an EOM FHIR Bundle resource directly to the Test Kit. 
Users will input the bundle either as a JSON string, or will provide a URL to where the JSON is being hosted, if applicable. 
The kit with then validate the structure of the bundle, as well as the resources the bundle contains.
- **Individual Resource Test:** This test allows users to submit any EOM FHIR resource directly to the Test Kit, bypassing the 
bundle process. Users will input their resources either as a JSON string, or will provide a URL to where the JSON is being hosted, 
if applicable. The kit with then validate the structure of all resources submitted. Only one resource of each type is allowed per run.

## Issue Reporting
If users experiences issues with the test kit, such as an unexpected error message or a mismatched validation, please report 
the issue by opening a New Issue on the Issues page of this GitHub repository. In the description, please provide a brief summary 
of the issue, as well as a screenshot of the Test Kit where the issue was observed.

## Documentation
- [Enhancing Oncology Model Implementation Guide](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/index.html)
- [Inferno documentation](https://inferno-framework.github.io/docs/)
- [Ruby API documentation](https://inferno-framework.github.io/inferno-core/docs/)
- [JSON API documentation](https://inferno-framework.github.io/inferno-core/api-docs/)
