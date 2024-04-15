import Link from "next/link";

type NavItemProps = {
  text: string;
  href: string;
  active?: boolean; // Optional property
};

const NavItem: React.FC<NavItemProps> = ({ text, href, active }) => {
  return (
    <Link href={href} legacyBehavior>
      <a className={`nav__link ${active ? "nav__link--active" : ""}`}>{text}</a>
    </Link>
  );
};

export default NavItem;
