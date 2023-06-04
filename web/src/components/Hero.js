import Image from "next/image";
import React from "react";

const Hero = () => {
  return (
    // <main className="flex min-h-screen flex-col items-center justify-between p-24">
    <section aria-label="Site Header" className="bg-white dark:bg-gray-900">
      <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-12 sm:px-6 lg:py-16 lg:px-8">
        <div class="grid grid-cols-1 gap-8 lg:grid-cols-2 lg:gap-16">
          <div class="relative h-64 overflow-hidden rounded-lg sm:h-80 lg:order-last lg:h-full">
            <Image
              //   width={300}
              //   height={400}
              fill
              alt="Party"
              src="/mockup.png"
              class="absolute inset-0 h-full md:scale-150 preview w-full object-cover"
            />
          </div>

          <div class="lg:py-24">
            <h2 class="text-4xl font-bold leading-5 sm:text-4xl dark:text-white">
              Transform Your Portfolio into an Immersive Storytelling
              Experience.
            </h2>

            <p class="mt-4 text-gray-600 dark:text-gray-400">
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aut qui
              hic atque tenetur quis eius quos ea neque sunt, accusantium soluta
              minus veniam tempora deserunt? Molestiae eius quidem quam
              repellat.
            </p>

            <a
              href="#"
              class="mt-8 inline-block rounded bg-teal-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-indigo-700 focus:outline-none focus:ring focus:ring-yellow-400"
            >
              Get Started Today
            </a>
          </div>
        </div>
      </div>
    </section>
    // </main>
  );
};

export default Hero;
