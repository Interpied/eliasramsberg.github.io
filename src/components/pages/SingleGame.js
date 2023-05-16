import { useParams } from 'react-router-dom';
import React from 'react';
import games_data from '../../data/games-data';
import '../Game.css'

function SingleGame() {
  const { gameId } = useParams();
  let { controls, name, embedId} = games_data.find((game) => game.id === gameId);

  if (!embedId) embedId = '6770940';

  return (
    <>
        {/* <h1>HELLO WORLD</h1> */}
        
        <div className='columnWrapper'>
            <div className='gameView'>
                {/* <iframe title='gameViewIFrame' frameborder="0" src={"https://itch.io/embed-upload/" + {embedId} + "?color=ffffff"} allowfullscreen="" width="100%" height="100%"></iframe> */}
                <iframe title='gameViewIFrame' frameborder="0" src={"https://itch.io/embed-upload/" + embedId + "?color=ffffff"} allowfullscreen="" width="100%" height="100%"></iframe>
            </div>
            <div className='sidebar'>
                {/* <Link to='/games'>
                    <p className='viewGamesButton'>View All Games</p>
                    </Link> */}
                <h5 className='gameTitle'>{name ? name : 'game not found'}</h5>
                <p className='controls'>{controls}</p>
            </div>
        </div>

    </>
  );
}

export default SingleGame;
