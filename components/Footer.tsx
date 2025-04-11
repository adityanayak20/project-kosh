// projekt-kosh-main/components/Footer.tsx
import Link from "next/link";
import React from "react";

const Footer = () => {
  return (
    <section className="max-w-7xl mx-auto border-t px-4">
      <div className="flex justify-between py-8">
        <p className="text-primary tracking-tight">
          Designed and Developed by{" "}
          {/* CHANGE THIS PART */}
          <span className="font-bold">
            Group 8
          </span>
          {/* END CHANGE */}
        </p>
      </div>
    </section>
  );
};

export default Footer;