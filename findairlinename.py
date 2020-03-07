import spacy

# !pip3 install spacy
# !python3 -m spacy download en
# en_core_web_sm
nlp = spacy.load("en")
doc = nlp("American Airlines is the best airline ever.")

# Simple Hack
airlines = ['United', 'United Airlines', 'Delta', 'Delta Airlines',
            'AmericanAir', 'American Airlines', 'FrontierCare', 'Frontier Airlines','AlaskaAir', 
            'FrontierAir', 'Alaska Airlines', 'JetBlue', 'Jet Blue', 'Jet Blue Airlines','SouthWestAir',
            'SouthWest Airlines', 'Southwest airlines', 'Virgin America', 'Virgin America Airlines',
            'VirginAmerica','USAirways','US Airways', 'SpiritAirlines','Spirit Airlines', 
            'HawaiianAir', 'Hawaiian Airlines']

for ent in doc.ents:
    if ent.label_ == "ORG":
       if ent.text.upper() in (name.upper() for name in airlines):
           print(ent.text)
       #print(ent.text, ent.start_char, ent.end_char, ent.label_)
