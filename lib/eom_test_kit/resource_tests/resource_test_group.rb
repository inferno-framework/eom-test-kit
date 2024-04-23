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
            The tests below allow users to input individual resources, either by url or as 
            a raw json, and have these resources validated.
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