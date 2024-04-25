require_relative './read_cancer_condition_test'
require_relative '../validation_tests/validate_cancer_condition_test'
require_relative './read_cancer_disease_status_test'
require_relative '../validation_tests/validate_cancer_disease_status_test'
require_relative './read_cancer_patient_test'
require_relative '../validation_tests/validate_cancer_patient_test'
require_relative './read_cancer_history_test'
require_relative '../validation_tests/validate_cancer_history_test'
require_relative './read_tnm_distant_metastasis_category_test'
require_relative '../validation_tests/validate_tnm_distant_metastasis_category_test'
require_relative './read_tnm_primary_tumor_category_test'
require_relative '../validation_tests/validate_tnm_primary_tumor_category_test'
require_relative './read_tnm_regional_node_category_test'
require_relative '../validation_tests/validate_tnm_regional_node_category_test'
require_relative './read_tumor_marker_test'
require_relative '../validation_tests/validate_tumor_marker_test'
require_relative './read_stage_group_test'
require_relative '../validation_tests/validate_stage_group_test'

module EOMTestKit
    class EOMResourceTestGroup < Inferno::TestGroup
        title 'Individual Resource Tests'
        id :eom_resource_test_group
        description %(
            This test allows users to submit any EOM FHIR resource directly to the Test Kit, bypassing the 
            bundle process. Users will input their resources either as a JSON string, or will provide a URL to where the JSON is being hosted, 
            if applicable. The kit will then validate the structure of all resources submitted. Only one resource of each type is allowed per run.

            ### Test Steps
            This test group contains a 2-step test for each resource type in the EOM IG:
            - **Receive the Resource:** This test will take the inputted FHIR resource, either as a JSON string, or a URL that points to the location
            the resource is being stored. It will then GET the resource if a URL is provided, and validate whether the provided string is both a valid JSON, 
            and that the JSON is in a known FHIR format.
            - **Validate the Resource:** This test will take the resource processed in the first step and validate it against the Structure Definition for 
            that resource type provided by the EOM IG. If there are any deviations from the Structure Definition, the test will raise a flag and provide 
            details on the discrepancy.

            ### Resource Structure Definitions
            - [EOM Primary Cancer Condition Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-primary-cancer-condition.html)
            - [EOM Cancer Disease Status Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-cancer-disease-status.html)
            - [EOM Cancer Patient Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-cancer-patient.html)
            - [EOM History of Metastatic Cancer](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-history-of-metastatic-cancer.html)
            - [EOM TNM Distant Metastasis Category Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-tnm-distant-metastasis-category.html)
            - [EOM TNM Primary Tumor Category Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-tnm-primary-tumor-category.html)
            - [EOM TNM Regional Node Category Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-tnm-regional-node-category.html)
            - [EOM Tumor Marker Test](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-tumor-marker-test.html)
            - [EOM TNM Stage Group Profile](https://build.fhir.org/ig/FirelyTeam/enhancing-oncology-model-ig/StructureDefinition-eom-tnm-stage-group.html)
        )

        run_as_group

        test from: :eom_read_cancer_condition_test
        test from: :eom_validate_cancer_condition_test

        test from: :eom_read_cancer_disease_status_test
        test from: :eom_validate_cancer_disease_status_test

        test from: :eom_read_cancer_patient_test
        test from: :eom_validate_cancer_patient_test

        test from: :eom_read_cancer_history_test
        test from: :eom_validate_cancer_history_test

        test from: :eom_read_tnm_distant_metastasis_category_test
        test from: :eom_validate_tnm_distant_metastasis_category_test

        test from: :eom_read_tnm_primary_tumor_category_test
        test from: :eom_validate_tnm_primary_tumor_category_test

        test from: :eom_read_tnm_regional_node_category_test
        test from: :eom_validate_tnm_regional_node_category_test

        test from: :eom_read_tumor_marker_test
        test from: :eom_validate_tumor_marker_test

        test from: :eom_read_stage_group_test
        test from: :eom_validate_stage_group_test
    end
end