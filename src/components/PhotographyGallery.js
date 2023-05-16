import React from "react"
import Masonry, {ResponsiveMasonry} from "react-responsive-masonry"
import "./PhotographyGallery.css";

function PhotographyGallery(props) {
  return (
    <>
        <ResponsiveMasonry
            columnsCountBreakPoints={{350: 1, 750: 2, 900: 3}}
        >
            <Masonry className='photoGallery'>
                <img alt='img' src='images/images/IMG_1514.JPG'/>
                <img alt='img' src='images/images/IMG_1510.JPG'/>
                <img alt='img' src='images/images/IMG_1508.JPG'/>
                <img alt='img' src='images/images/IMG_1489.JPG'/>
                <img alt='img' src='images/images/IMG_1388.JPG'/>
                <img alt='img' src='images/images/IMG_1401.JPG'/>
                <img alt='img' src='images/images/IMG_1287.JPG'/>
                <img alt='img' src='images/images/IMG_1305.JPG'/>
                <img alt='img' src='images/images/IMG_1322.JPG'/>
                <img alt='img' src='images/images/IMG_1323.JPG'/>
                <img alt='img' src='images/images/IMG_1327.JPG'/>
                <img alt='img' src='images/images/IMG_1329.JPG'/>
                <img alt='img' src='images/images/IMG_1349.JPG'/>
                <img alt='img' src='images/images/IMG_1215.JPG'/>
                <img alt='img' src='images/images/IMG_1256.JPG'/>
                <img alt='img' src='images/images/IMG_1163.JPG'/>
                <img alt='img' src='images/images/IMG_1192.JPG'/>
                <img alt='img' src='images/images/IMG_1208.JPG'/>
                <img alt='img' src='images/images/IMG_1201.JPG'/>
            </Masonry>
        </ResponsiveMasonry>
    </>
  );
}

export default PhotographyGallery;
