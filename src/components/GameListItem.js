import React from 'react';
// import { Link } from 'react-router-dom';

function GameListItem (props) {
    return (
        <>
            <div className='spacer' id={props.id ? props.id : ''}></div>
            <li className='gameList__item' style={{background: props.bgcolor ? props.bgcolor : '#efd5de'}}>
                <div>
                    <h5 className='gameList__item__title'>{props.text}</h5>
                </div>
                <div className ='gameList__wrapper'>
                    <div className='bigImgWrapper'>
                        <img
                        className='gameList__item__img1'
                        alt='GamePreview'
                        src={ props.img1 ? props.img1 : 'images/wip.png' }
                        />
                    </div>
                    <div className='smallImgWrapper'>
                        <img
                        className='gameList__item__img2'
                        alt='GamePreview'
                        src={ props.img2 ? props.img2 : 'images/wip.png' }
                        />
                        <img
                        className='gameList__item__img3'
                        alt='GamePreview'
                        src={ props.img3 ? props.img3 : 'images/wip.png' }
                        />
                    </div>

                    <div className='descWrapper'>
                        <h5 className='gameList__item__desc__title'>Description</h5>
                        <p className='gameList__item__text'>{
                        props.desc
                        ? props.desc
                        : '[PLACEHOLDER] Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. [PLACEHOLDER]'
                        }</p>
                        <a href={props.path} className='playButton'>
                            <button>PLAY</button>
                        </a>
                    </div>
                </div>
            </li>
        </>
    );
}

export default GameListItem;

// import React from 'react';
// import { Link } from 'react-router-dom';

// function GameListItem (props) {
//     return (
//         <>
//             <li className='gameList__item'>
//                     <div>
//                         <h5 className='gameList__item__title'>{props.text}</h5>
//                     </div>
//                 <div classNmae ='gameList__wrapper'>

//                     <div className='bigImgWrapper'>

//                     </div>
//                     <div className='smallImgWrapper'>

//                     </div>

//                     <div className='descWrapper'>
                        
//                     </div>
//                 </div>
//             </li>
//         </>
//     );
// }

// export default GameListItem;