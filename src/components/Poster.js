// // import React, { useRef, useState } from "react";
// import React from "react";
// // Import Swiper React components
// // import { Swiper, SwiperSlide } from "swiper/react";
// // import Pagination from 'swiper/css/pagination';
// // import Mousewheel from 'swiper/css/mousewheel';

// // // Import Swiper styles

// // import "swiper/css/pagination";
// import { Pagination, Navigation, HashNavigation } from "swiper";
// import { Swiper, SwiperSlide } from "swiper/react";
// import 'swiper/swiper-bundle.min.css'
// import 'swiper/swiper.min.css'
// import "./Gallery.css";

// function Poster(props) {
//   return (
//     <>
//         {/* <Swiper
//         spaceBetween={50}
//         slidesPerView={3}
//         centeredSlides
//         onSlideChange={() => console.log("slide change")}
//         onSwiper={swiper => console.log(swiper)}
//         >
//         <SwiperSlide>Slide 1</SwiperSlide>
//         <SwiperSlide>Slide 2</SwiperSlide>
//         <SwiperSlide>Slide 3</SwiperSlide>
//         <SwiperSlide>Slide 4</SwiperSlide>
//         </Swiper> */}
//         {/* <Slider main container> */}
//         <div className='swiperHeader'>Posters</div>
//         <div className="swiperContainer">
//             <Swiper
//                 spaceBetween={30}
//                 hashNavigation={{
//                 watchState: true,
//                 }}
//                 pagination={{
//                 clickable: true,
//                 }}
//                 navigation={true}
//                 modules={[Pagination, Navigation, HashNavigation]}
//                 className="mySwiper"
//             >
//                 <SwiperSlide data-hash="slide1"><img src='images/img-1.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide2"><img src='images/img-2.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide3"><img src='images/img-3.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide4"><img src='images/img-4.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide5"><img src='images/img-5.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide6"><img src='images/img-6.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide7"><img src='images/img-7.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide8"><img src='images/img-8.jpg' alt='img'></img></SwiperSlide>
//                 <SwiperSlide data-hash="slide9"><img src='images/img-9.jpg' alt='img'></img></SwiperSlide>
//             </Swiper>
//         </div>
//     </>
//   );
// }

// export default Poster;
