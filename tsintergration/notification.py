

import json
import time
import requests
from pprint import pprint



def slack_message(card_name, status):
    response_dict = {}
    response_body = "the card {} is marked as {}".format(card_name,status)
    response_dict['text'] = response_body
    notifcation = json.dumps(response_dict)
    return response_body



if __name__ == "__main__":
    

    with open('card.json') as data_file:    
        trello_message = json.load(data_file)
        status = trello_message["data"]['listAfter']['name']
        card_name = trello_message["data"]['card']['name']
        message = slack_message(card_name, status)

    r = requests.post('https://requestb.in/11t1ztv1', 
        data={"ts":time.time(), "text": message}
    )
    # print(r.status_code)
    # print(r.content)