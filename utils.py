import requests
from bs4 import BeautifulSoup
BASE_URL = 'https://slamdunk.fandom.com/'

import concurrent.futures



def find_row(table , name):
    if(not table):
        return None
    row = table.find('b' , text = name)
    if(not row):
        return None
    par = row.parent.parent
    td = (par.find_all('td')[-1].text.strip()).replace('\n' , ',')
    return td

def get_coach_info(url):
    # print(BASE_URL + url)
    response = requests.get(BASE_URL + url)
    html = response.content

    # Phân tích cú pháp HTML của trang web
    soup = BeautifulSoup(html, 'html.parser')
    info_box = soup.find('table' , class_= 'infobox')
   
    return {'name' : url.split('/')[-1].replace('_' , ' '),
    'aliases' : find_row(info_box , "Aliases"),
    'gender' : find_row(info_box , "Gender"),
    'birthday' : find_row(info_box , "Birthday")}
    


def get_high_school_info(url):
    response = requests.get(BASE_URL + url)
    html = response.content

    # Phân tích cú pháp HTML của trang web
    soup = BeautifulSoup(html, 'html.parser')
    info_box = soup.find('table' , class_= 'infobox')
    perfecture = find_row(info_box , "Prefecture")
    if perfecture == None:
        perfecture = find_row(info_box , "Region")
    team_captain_name = find_row(info_box, "Team Captain")
    if(team_captain_name == None):
        team_captain_name = find_row(info_box, "Captain")
    vice_captain_name = find_row(info_box, "Vice-Captain")
    if(vice_captain_name == None):
        vice_captain_name = find_row(info_box, "Vice-captain")    

    return {'name' : url.split('/')[-1].replace('_' , ' '),
    'perfecture' :  perfecture,
    'team_captain_name' : team_captain_name,
    'vice_captain_name' : vice_captain_name,
    'coach_name' : find_row(info_box, "Coach")}


def get_player_info(url):
    response = requests.get(BASE_URL + url)
    html = response.content

    # Phân tích cú pháp HTML của trang web
    soup = BeautifulSoup(html, 'html.parser')
    info_box = soup.find('table' , class_= 'infobox')
    jersey = find_row(info_box, "Jersey")
    if(jersey == None):
        jersey = find_row(info_box, "Jersey Number")
    return {'name' : url.split('/')[-1].replace('_' , ' '),
    'aliases' :  find_row(info_box , "Aliases"),
    'gender' : find_row(info_box , "Gender"),
    'birthday' : find_row(info_box , "Birthday"),
    'age' : find_row(info_box , "Age") ,
    'height' : find_row(info_box , "Height") ,
    'weight' : find_row(info_box , "Weight") ,
    'year' : find_row(info_box , "Year") ,
    'position' : find_row(info_box , "Position") ,
    'jersey' : jersey ,
    }


def get_coach_info_multi_threaded(urls):
    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Submit each URL to the executor
        futures = [executor.submit(get_coach_info, url) for url in urls]

        # Wait for all the futures to complete and retrieve the results
        results = []
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            if result:
                results.append(result)

    return results
def get_high_school_info_multi_threaded(urls):
    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Submit each URL to the executor
        futures = [executor.submit(get_high_school_info, url) for url in urls]

        # Wait for all the futures to complete and retrieve the results
        results = []
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            if result:
                results.append(result)

    return results
def get_player_info_multi_threaded(urls):
    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Submit each URL to the executor
        futures = [executor.submit(get_player_info, url) for url in urls]

        # Wait for all the futures to complete and retrieve the results
        results = []
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            if result:
                results.append(result)

    return results