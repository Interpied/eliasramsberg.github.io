import React from 'react';
//import { Link } from 'react-router-dom';
import { HashLink as Link } from 'react-router-hash-link';

function GamePreviewItem(props) {
  return (
    <>
      <li className='gamePreview__item'>
        <Link className='gamePreview__item__link' to={props.path ? props.path : '/games'}>
          <figure className='gamePreview__item__pic-wrap'>
            <img
              className='gamePreview__item__img'
              alt='GamePreview'
              src={ props.src ? props.src : 'images/wip.png' }
            />
          </figure>
        </Link>
      </li>
    </>
  );
}

export default GamePreviewItem;
