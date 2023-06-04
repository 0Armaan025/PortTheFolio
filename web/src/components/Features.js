"use client";
import { motion } from "framer-motion";
import Image from "next/image";
import React, { useState } from "react";

const Features = () => {
  const featuresList = [
    {
      name: "Shooting Stars",
      desc: "Blue bottle crucifix vinyl post-ironic four dollar toast vegan taxidermy. Gastropub indxgo juice poutine.",
      svg: (
        <svg
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          class="w-6 h-6"
          viewBox="0 0 24 24"
        >
          <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
        </svg>
      ),
      image: "/feature1.png",
    },
    {
      name: "The Catalyzer",
      desc: "Blue bottle crucifix vinyl post-ironic four dollar toast vegan taxidermy. Gastropub indxgo juice poutine.",
      svg: (
        <svg
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          class="w-6 h-6"
          viewBox="0 0 24 24"
        >
          <circle cx="6" cy="6" r="3"></circle>
          <circle cx="6" cy="18" r="3"></circle>
          <path d="M20 4L8.12 15.88M14.47 14.48L20 20M8.12 8.12L12 12"></path>
        </svg>
      ),
      image: "/feature2.png",
    },
    {
      name: "Neptune",
      desc: "Blue bottle crucifix vinyl post-ironic four dollar toast vegan taxidermy. Gastropub indxgo juice poutine.",
      svg: (
        <svg
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          class="w-6 h-6"
          viewBox="0 0 24 24"
        >
          <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
          <circle cx="12" cy="7" r="4"></circle>
        </svg>
      ),
      image: "/feature3.png",
    },
  ];
  const [selectedFeature, setSelectedFeature] = useState(featuresList[0]);

  return (
    <section
      id="features"
      aria-label="Site Header"
      className="bg-white dark:bg-gray-900"
    >
      <div class="text-gray-600 body-font">
        <motion.h1
          whileInView={{ x: [-100, 0], opacity: [0, 1] }}
          transition={{ duration: 0.5, delayChildren: 0.5 }}
          className="container px-5 mx-auto text-4xl font-bold leading-5 sm:text-4xl dark:text-white"
        >
          Features
        </motion.h1>
        <div class="container px-5 py-24 mx-auto flex flex-wrap">
          <motion.div
            whileInView={{ x: [-100, 0], opacity: [0, 1] }}
            transition={{ duration: 0.5, delayChildren: 0.5 }}
            class="lg:w-1/2 w-full mb-10 lg:mb-0 rounded-lg overflow-hidden"
          >
            <Image
              alt="feature"
              class="object-cover object-center h-full w-full"
              width={600}
              height={800}
              src={selectedFeature.image}
            />
          </motion.div>
          <motion.div
            whileInView={{ x: [100, 0], opacity: [0, 1] }}
            transition={{ duration: 0.5, delayChildren: 0.5 }}
            class="flex flex-col flex-wrap lg:py-6 -mb-10 lg:w-1/2 lg:pl-12 lg:text-left justify-center text-center"
          >
            {featuresList.map((item, i) => (
              <div
                key={i}
                onMouseEnter={() => setSelectedFeature(featuresList[i])}
                class="flex flex-col mb-10 lg:items-start items-center"
              >
                <div class="w-12 h-12 inline-flex items-center justify-center rounded-full bg-teal-100 text-teal-500 mb-5">
                  {item.svg}
                </div>
                <div class="flex-grow">
                  <h2 class="text-gray-900 text-lg title-font font-medium mb-3 dark:text-white">
                    {item.name}
                  </h2>
                  <p class="leading-relaxed text-base">{item.desc}</p>
                  <a class="mt-3 text-teal-500 inline-flex items-center">
                    Learn More
                    <svg
                      fill="none"
                      stroke="currentColor"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      class="w-4 h-4 ml-2"
                      viewBox="0 0 24 24"
                    >
                      <path d="M5 12h14M12 5l7 7-7 7"></path>
                    </svg>
                  </a>
                </div>
              </div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
};

export default Features;
