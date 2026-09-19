// Resume content. Edit here, then run `npm run resume:pdf` to refresh the PDF.
export const resume = {
	name: 'Rodrick Vyizigiro',
	title: 'IT Support / Help Desk Technician',
	contact: {
		location: 'Vancouver, BC, Canada',
		phone: '(343) 401-9289',
		email: 'rodrielnt@gmail.com',
		linkedin: 'linkedin.com/in/rodvy'
	},
	pdf: '/Rodrick-Vyizigiro-Resume.pdf',
	summary:
		'IT support-focused Computer Systems Technology student with hands-on experience diagnosing, refurbishing, configuring, and quality-checking computer hardware. CompTIA Security+ certified, with experience supporting and onboarding volunteers, explaining technical processes clearly, and following structured troubleshooting workflows. Strong foundation in Windows systems, networking, hardware, cybersecurity, and customer-focused technical support.',
	skills: [
		{
			label: 'Support',
			items: 'Hardware troubleshooting, desktop/laptop repair, system setup, user support, technical documentation, volunteer onboarding, step-by-step technical instruction'
		},
		{
			label: 'Systems & Networking',
			items: 'Windows, Windows Server fundamentals, TCP/IP, DNS, DHCP, VLAN fundamentals, Active Directory fundamentals, basic PowerShell'
		},
		{
			label: 'Security',
			items: 'CompTIA Security+, access control, authentication, security fundamentals, troubleshooting methodology'
		},
		{
			label: 'Other',
			items: 'C#, JavaScript, problem-solving, teamwork, time management, clear technical communication'
		}
	],
	certifications: [{ name: 'CompTIA Security+', issuer: 'CompTIA', year: '2026' }],
	experience: [
		{
			role: 'Hardware Technician Intern',
			org: 'Reusetech BC',
			location: 'Burnaby, BC',
			dates: 'Jan 2026 - Present',
			points: [
				'Diagnose, repair, test, refurbish, and quality-check laptops, desktops, monitors, and other computer equipment using structured technical workflows.',
				'Support volunteers with day-to-day technical questions and provide hands-on guidance when troubleshooting or completing refurbishment tasks.',
				'Onboard and train volunteers on refurbishment processes, work procedures, quality standards, and safe handling of equipment.',
				'Prepare systems for reuse by verifying hardware functionality, identifying faults, and completing required configuration and testing.',
				'Maintain organized work areas and support inventory and equipment-handling processes in a high-volume technical environment.'
			]
		}
	],
	volunteer: [
		{
			role: 'Digital Literacy Program Coordinator',
			org: 'Africa-Canada Education Foundation',
			location: 'Surrey, BC',
			dates: 'Jun 2025 - Present',
			points: [
				'Designed a beginner digital literacy curriculum based on the BC Digital Literacy Framework, written for learners with little or no tech experience.'
			]
		},
		{
			role: 'Audio/Visual Volunteer',
			org: 'Westminster SDA Church',
			location: 'New Westminster, BC',
			dates: '2021 - 2023',
			points: [
				'Created the slides shown during weekly services.',
				'Worked with the AV team and program participants to keep each service running smoothly.',
				'Handled technical issues and troubleshot equipment live, mid-service when needed.'
			]
		}
	],
	projects: [
		{
			name: 'Home IT / Cybersecurity Lab',
			text: 'Built a hands-on lab using Proxmox, OPNsense, Cisco managed switches, and Windows Server to practice virtualization, VLAN segmentation, Active Directory, Group Policy, networking, and RADIUS/802.1X concepts.'
		},
		{
			name: 'StormHacks (SFU), Hackathon Team Project',
			text: 'Developed a C#-based interactive system using a microcontroller, applying debugging, teamwork, and rapid technical problem-solving.'
		}
	],
	education: [
		{
			credential: 'Diploma in Computer Systems Technology',
			school: 'British Columbia Institute of Technology (BCIT)',
			location: 'Burnaby, BC'
		}
	]
};
