require 'securerandom'

module EOMTestKit
    class PostBundleTest < Inferno::Test
        id :eom_post_patient_bundle_test
        title 'Receive EOM Patient Bundle Resource via POST request'
        description %(
            Test waits for a patient bundle JSON to be posted at the 
            provided location. Test passes if it receives a POST
            request within 3 mins of test start.
        )

        receives_request :patient_bundle

        run do
            session_id = SecureRandom.urlsafe_base64(10)
            wait(
                identifier: session_id,
                timeout: 300,
                message: %(
                    Post your Patient Bundle JSON to the following URL:
                    #{Inferno::Application['base_url']}/custom/eom_test_suite/postHere?id=#{session_id}

                    If the test times out or is cancelled for any reason, rerunning the test group will restart the timeout.

                    Your request body MUST be your Patient Bundle in raw JSON format. Testing will resume automatically after a valid POST is received.
                )
            )
        end
    end
end