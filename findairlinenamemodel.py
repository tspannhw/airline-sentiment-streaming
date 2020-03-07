import spacy
import sys

# !pip3 install spacy
# !python3 -m spacy download en
# en_core_web_sm


def find_airlinename(args):
  sentence = args.get('sentence')
  nlp = spacy.load("en")
  doc = nlp(sentence)
  airlinename = 'None'
  
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
           airlinename = ent.text
      
  return airlinename
