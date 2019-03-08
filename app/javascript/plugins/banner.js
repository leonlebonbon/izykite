import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["windy", "sunny", "amazing", "fun", "exotic"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
