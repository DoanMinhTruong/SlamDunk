import os 
import re
from sqlalchemy import create_engine, text, Table, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import sessionmaker,relationship
from sqlalchemy.exc import OperationalError
from sqlalchemy.orm import declarative_base

import requests
from bs4 import BeautifulSoup


import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.edge.service import Service
from selenium.webdriver.edge.options import Options

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

basedir = os.path.abspath(os.path.dirname(__file__))
DATABASE_URL = 'sqlite:///' + os.path.join(basedir, 'slamdunk.db')
BASE_URL = 'https://slamdunk.fandom.com/'
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()
with open('slamdunk.db', 'w') as file:
    file.truncate(0)


edge_path = './edgedriver_win64/msedgedriver.exe'
edge_options = Options()
edge_options.use_chromium = True
edge_options.add_argument("--disable-features=RendererCodeIntegrity")
edge_options.add_argument("--disable-smart-screen")
edge_options.add_argument("--disable-downloading-protection")
# edge_options.binary_location = edge_path
driver = webdriver.Edge(service=Service(edge_path), options=edge_options)
CHARACTER_PAGE = BASE_URL + '/wiki/Characters'
driver.implicitly_wait(3)

driver.get(CHARACTER_PAGE)



# wait (up to 20 seconds) until the images are visible on page
# images = WebDriverWait(driver, 20).until(EC.visibility_of_all_elements_located((By.TAG_NAME, "img")))
# scroll to the last image, so that all images get rendered correctly
# driver.execute_script('arguments[0].scrollIntoView({block: "center", behavior: "smooth"});', images[-1])
driver.execute_script("""
    function slowScrollToBottom() {
        var scrollHeight = document.body.scrollHeight;
        var currentScroll = 0;
        var step = 10;
        var delay = 15;

        var scrollInterval = setInterval(function() {
            if (currentScroll < scrollHeight) {
                window.scrollBy(0, step);
                currentScroll += step;
            } else {
                clearInterval(scrollInterval);
            }
        }, delay);
    }

    slowScrollToBottom();
""")
time.sleep(5)

#### LÀM ƠN, LÚC WEBBROWERS HIỆN RA THÌ KÉO XUỐNG TẬN ĐÁY CHO NÓ LOAD HẾT HÌNH

## Tiến hành xóa tất cả database






Base = declarative_base()

class HighSchool(Base):
    __tablename__ = 'high_school'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    perfecture = Column(String)
    captain_id = Column(Integer, ForeignKey('player.id'))
    vice_captain_id = Column(Integer, ForeignKey('player.id'))
    coach_id = Column(Integer, ForeignKey('coach.id'))
    img = Column(String)
    captain = relationship('Player', foreign_keys=[captain_id], backref='captain_of')
    vice_captain = relationship('Player', foreign_keys=[vice_captain_id], backref='vice_captain_of')
    coach = relationship('Coach', foreign_keys=[coach_id], backref='high_schools_coached')
    
    players = relationship('Player', foreign_keys='Player.high_school_id', back_populates='high_school')

class Coach(Base):
    __tablename__ = 'coach'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    aliases = Column(String)
    gender = Column(String)
    birthday = Column(String)
    img = Column(String)
    high_school_id = Column(Integer, ForeignKey('high_school.id'))
    
    high_school = relationship('HighSchool', foreign_keys=[high_school_id], backref='coaches')

class Player(Base):
    __tablename__ = 'player'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    aliases = Column(String)
    gender = Column(String)
    birthday = Column(String)
    age = Column(Integer)
    height = Column(Integer)
    weight = Column(Integer)
    high_school_id = Column(Integer, ForeignKey('high_school.id'))
    year = Column(Integer)
    position = Column(String)
    jersey = Column(String)
    img = Column(String)

    high_school = relationship('HighSchool', foreign_keys=[high_school_id], back_populates='players')
    
    def __repr__(self):
        return f"<Player(name='{self.name}', high_school='{self.high_school.name}')>"

Base.metadata.create_all(engine)

# Tải nội dung của trang CHARACTER

# response = requests.get(CHARACTER_PAGE)
# html = response.content

# Phân tích cú pháp HTML của trang web
soup = BeautifulSoup(driver.page_source, 'html.parser')
# print(soup)
# Trích xuất các thông tin từ trang web
content = soup.find('div' , class_='mw-parser-output')
tables = content.find_all('table' , recursive=False)
basketball = tables[0:6]
none_basketball = tables[6:]
coach_info = []
high_school_info = []
player_info = []

from utils import *
for table in basketball:
    find_font = table.find_all('font')
    for f in find_font:
        small = f.find('small')
        if(small):
            if (re.search(r'\bCoach\b', small.text) ):
                # print(f)
                href = f.parent
                # print(href)
                try:
                    img = table.find('a' , {'href' : href['href']})
                except:
                    img = table.find('a' , {'href' : '/wiki/Kanehira'})
                res_img = img.find('img')['src']
                img = img.parent
                img.extract()
                high_school = table.find('a')
                high_school_name = high_school['title']
                high_school_url = high_school['href']
                high_school_img = high_school.find('img')['src']
                high_school.extract()
                get_high_school = {}
                get_high_school['url'] = high_school_url
                # get_high_school = get_high_school_info(high_school_url)
                get_high_school['img'] = high_school_img
                # print(get_high_school)
                high_school_info.append(get_high_school)
                if(href.name == 'a'):
                   get_coach = {}
                   get_coach['url'] = href['href']
                #    get_coach = get_coach_info(href['href'])
                   get_coach['img']= res_img
                   get_coach['high_school'] = high_school_name
                   coach_info.append(get_coach)
                else:
                    get_coach = {}
                    get_coach['url'] = '/None'
                    get_coach['img'] = res_img
                    get_coach['name'] = 'Kanehira'
                    get_coach['high_school'] = 'Toyotama High School'
                    coach_info.append(get_coach)
                href = href.parent
                href.extract()
                imgs = table.find_all('img')
                for img in imgs:
                    player_img = img['src']
                    img  = img.parent
                    href = img['href'].replace('Link%3D','')
                    get_player = {}
                    get_player['url'] = href
                    # get_player = get_player_info(href)
                    get_player['high_school_name'] = high_school_name
                    get_player['img'] = player_img
                    player_info.append(get_player)
    

for coach in coach_info:
    if(coach['high_school'] == 'Shoyo High School'):
        coach['high_school_name'] = coach['high_school']
        player_info.append(coach)
        break


coach_info2 = (get_coach_info_multi_threaded([coach['url'] for coach in coach_info]))[::-1]
high_school_info2 = (get_high_school_info_multi_threaded([hs['url'] for hs in high_school_info]))[::-1]
player_info2 = (get_player_info_multi_threaded([player['url'] for player in player_info]))[::-1]

print(coach_info)
for c1 in coach_info:
    for c2 in coach_info2:
        a = (c1['url'].split('/'))[-1].replace('_',' ')
        if( a== c2['name']):
            c1.update(c2)
            break

for c1 in high_school_info:
    for c2 in high_school_info2:
        a = (c1['url'].split('/'))[-1].replace('_',' ')
        if( a== c2['name']):
            c1.update(c2)
            break
for c1 in player_info:
    for c2 in player_info2:
        a = (c1['url'].split('/'))[-1].replace('_',' ')
        if( a== c2['name']):
            c1.update(c2)
            break


for hs in high_school_info:
    
    hs1 = HighSchool(name=hs['name'], perfecture=hs['perfecture'], img=hs['img'] )
    session.add(hs1)
    session.commit()

for coach in coach_info:
    high_school_id = session.query(HighSchool).filter(HighSchool.name == coach['high_school']).first().id
    coach1 = Coach(name=coach['name'],high_school_id = high_school_id , aliases=coach['aliases'], gender=coach['gender'], birthday=coach['birthday'] , img = coach['img'])
    session.add(coach1)
    session.commit()



for p in player_info:
    high_school_id = session.query(HighSchool).filter(HighSchool.name == p['high_school_name']).first().id
    p1 = Player(name=p['name'], aliases=p['aliases'] ,gender=p['gender'],birthday=p['birthday'], height=p['height'] ,weight=p['weight'],
            high_school_id = high_school_id, img=p['img'], age=p['age'],  year=p['year'], position=p['position'] ,jersey=p['jersey'])
    session.add(p1)
    session.commit()

for hs in high_school_info:
    print(hs['team_captain_name'] , hs['vice_captain_name'])
    
    hs1 = session.query(HighSchool).filter(HighSchool.name == hs['name']).first()
    captain_id= session.query(Player).filter(Player.name == hs['team_captain_name']).first()
    if(captain_id != None):
        hs1.captain_id = captain_id.id
    vice_captain_id= session.query(Player).filter(Player.name == hs['vice_captain_name']).first()
    if(vice_captain_id!=None):
        hs1.vice_captain_id= vice_captain_id.id
    hs1.coach_id= session.query(Coach).filter(Coach.high_school_id == hs1.id).first().id
    # 
    session.commit()


# for hs in high_school_info:
#     print(hs['name'])
# high_school = HighSchool(name='My High School', perfecture='Tokyo')

# # create a new Coach object
# coach = Coach(name='John Smith', aliases='Coach J', gender='Male', birthday="date(1990, 1, 1)", img='http://example.com/coach.jpg')

# # create a new Player object
# player = Player(name='Jane Doe', aliases='Player J', gender='Female', birthday="date(2000, 1, 1)", age=21, height=170, weight=60, year=3, position='Forward', jersey='10')

# # add the new objects to the session
# session.add(high_school)
# session.add(coach)
# session.add(player)

# # associate the objects with each other
# high_school.coach = coach
# high_school.players.append(player)

# # commit the changes to the database
# session.commit()

# for table in basketball:
#     tbody = table.find('tbody')
#     if tbody:
#         name_high_school = tbody.find("tr").find('img')['alt']
#         if name_high_school:
#             print(name_high_school)

session.close()
