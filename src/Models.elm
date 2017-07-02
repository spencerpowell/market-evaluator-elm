module Models exposing (..)

type alias Model =
    { username: String
    , error: String
    , pageIndex: Int
    , selectedRating: Int
    , titles: List String
    , prompts: List String
    , examples: List String
    , totalScore: Int
    , scores: List Int
    , adviceResults: List String
    }


initialModel : Model
initialModel =
    { username = "Spencer"
    , error = ""
    , pageIndex = 0
    , selectedRating = 0
    , totalScore = 0
    , scores = []
    , titles =
        [ "Ten Ways to Evaluate a Market"
        , "Urgency"
        , "Market Size"
        , "Pricing Potential"
        , "Cost of Customer Acquisition"
        , "Cost of Value Delivery"
        , "Uniqueness of Offer"
        , "Speed to Market"
        , "Up-Front Investment"
        , "Upsell Potential"
        , "Evergreen Potential"
        , "Total Score: "
        ]
    , prompts =
        [ "Use this tool to identify the attractiveness of any potential market"
        , "How badly do people want or need this right now?"
        , "How many people are actively purchasing things like this?"
        , "What is the highest price a typical purchaser would be willing to spend for a solution?"
        , "How easy is it to acquire a new customer?"
        , "How easy would it be to create and deliver the value offered, both in money and effort?"
        , "How unique is your offer versus competing offerings in the market, and how hard is it for potential competitors to copy you?"
        , "How quickly can you create something to sell?"
        , "How easy is the initial investment before you're ready to sell?"
        , "Are there related secondary offers that you could also present to purchasing customers?"
        , "Once the initial offer has been created, how easy will it be to maintain and continue selling?"
        ]
    , examples =
        [ "Rate each of the following ten factors on a scale of 0 to 10, where 0 is extremely unattractive and 10 is extremely attractive."
        , "Renting an old movie is typically low urgency; seeing the first showing of a new movie on opening night is high urgency, since it only happens once."
        , "The market for underwater basket weaving courses is very small; the market for cancer cures is massive."
        , "Lollipops sell for $0.05; aircraft carriers sell for billions."
        , "Restaurants built on high-traffic interstate high-ways spend little to bring in new customers.  Government contractors can spend millions landing major procurement deals."
        , "Delivering files via the Internet is almost free; inventing a product and building a factor costs millions."
        , "There are many hair salons, but very few companies that offer private space travel."
        , "You can offer to mow a neighbor's lawn in minutes; opening a bank can take years."
        , "To be a housekeeper, all you need is a set of inexpensive cleaning products.  To mine for gold, you need millions to purchase land and excavating equipment."
        , "Customers who purchase razors need shaving cream and extra blades as well; buy a Frisbee, and you won't need another unless you lose it."
        , "Business consulting requires ongoing work to get paid; a book can be produced once, then sold over and over as is."
        ]
    , adviceResults =
        [ "Since your score is below 50, it is recommended that you move on to another idea.  There are probably better places to invest your energy and resources."
        , "Since your score is between 50 and 75, it has the potential to pay the bills, but won't be a home run without a huge investment of energy and resources, so plan accordingly."
        , "Since your score is above 75, you have a very promising idea - full speed ahead!"
        ]
    }
