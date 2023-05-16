import React from 'react';
import './Cards.css';
import CardItem from './CardItem';

function Cards() {
  return (
    <div className='cards'>
      {/* <h1 id="projectList">Categories</h1> */}
      <div className='cards__container'>
        <div className='cards__wrapper'>
          <ul className='cards__items'>
            <CardItem
              src='images/games_cover.png'
              text='Games'
              label=''
              path='/games'
            />
            <CardItem
              src='images/design-cover.png'
              text='Design'
              label=''
              path='/design'
            />
            <CardItem
              src='images/programming_cover.png'
              text='Programming'
              label=''
              path='/programming'
            />
          </ul>

          <ul className='cards__items'>
            <CardItem
              src='images/art_cover.png'
              text='Art'
              label=''
              path='/art'
            />
            <CardItem
              src='images/images/IMG_1508.jpg'
              text='Photography'
              label=''
              path='/photography'
            />
            <CardItem
              src='images/processing-cover.png'
              text='Processing'
              label=''
              path='/processing'
            />
            <CardItem
              src='images//images/IMG_1201.jpg'
              text='Misc'
              label=''
              path='/misc'
            />
          </ul>
        </div>
      </div>
    </div>
  );
}

export default Cards;
