// docusaurus.config.js
module.exports = {
  title: 'Developer Platform',
  tagline: 'Empowering Developers with the Best Tools',
  url: 'https://your-developer-platform.com',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'apipinic', // Your GitHub org/user name.
  projectName: 'docusaurus-pipinic', // Your repo name.
  themeConfig: {
    navbar: {
      title: 'Developer Platform',
      logo: {
        alt: 'Platform Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          to: '/docs/intro',
          activeBasePath: 'docs',
          label: 'Docs',
          position: 'left',
        },
        {
          href: 'https://github.com/apipinic/docusaurus-pipinic',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Getting Started',
              to: '/docs/intro',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'Stack Overflow',
              href: 'https://stackoverflow.com/questions/tagged/docusaurus',
            },
            {
              label: 'Discord',
              href: 'https://discordapp.com/invite/docusaurus',
            },
            {
              label: 'Twitter',
              href: 'https://twitter.com/docusaurus',
            },
          ],
        },
        {
          title: 'More',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/apipinic/docusaurus-pipinic',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} My Company, Inc. Built with Docusaurus.`,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/apipinic/docusaurus-pipinic/edit/main/website/',
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
