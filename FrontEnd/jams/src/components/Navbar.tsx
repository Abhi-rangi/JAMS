import Link from "next/link";
import React, { useState } from "react";
import NavItem from "./NavItem";
import Image from "next/image";
type Menu = {
  text: string;
  href: string;
};

const MENU_LIST: Menu[] = [
  { text: "Search", href: "/search" },
  { text: "Search Reservation", href: "/reservation" },
  { text: "Make Reservation", href: "/reservation"}
];

const Navbar: React.FC = () => {
  const [navActive, setNavActive] = useState<boolean | null>(null);
  const [activeIdx, setActiveIdx] = useState<number>(-1);

  return (
    <header>
      <nav className="nav">
        <Link href="/" legacyBehavior>
          <a>
            <h1 className="logo">JAMS</h1>
          </a>
        </Link>
        <div onClick={() => setNavActive(!navActive)} className="nav__menu-bar">
          <div></div>
          <div></div>
          <div></div>
        </div>
        <div className={`${navActive ? "active" : ""} nav__menu-list`}>
          {MENU_LIST.map((menu, idx) => (
            <div
              onClick={() => {
                setActiveIdx(idx);
                setNavActive(false);
              }}
              key={menu.text}
            >
              <NavItem active={activeIdx === idx} {...menu} />
            </div>
          ))}
        </div>
      </nav>
    </header>
  );
};

export default Navbar;
