module FiftyFiveHundredsHelper

  def questions
    @questions ||= [
    "1. Did the plan hold any assets whose current value was neither readily determinable on an established market nor set by an independent third party appraiser?",
    "2.Did the plan receive any noncash contributions whose current value was neither readily determinable on an established market nor set by an independent third party appraiser?",
    "3.Is the plan covered by a Fidelity Bond?",
    "4. If yes, please enter the Fidelity Bond amount.",
    "5.Were any loans by the plan or fixed income obligations due to the plan in default as of the end of the close of the plan year or classified as uncollectible?  Disregard participant loans secured by the participant’s account balance.",
    "6.Were any leases to which the plan was a party in default or classified during the year as uncollectible?"
    ]
  end

end
