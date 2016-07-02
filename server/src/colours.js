let lookup = {
	0x1: "0",
	0x2: "1",
	0x4: "2",
	0x8: "3",
	0x10: "4",
	0x20: "5",
	0x40: "6",
	0x80: "7",
	0x100: "8",
	0x200: "9",
	0x400: "a",
	0x800: "b",
	0x1000: "c",
	0x2000: "d",
	0x4000: "e",
	0x8000: "f"
};

export default {
	white: 0x1,
	orange: 0x2,
	magenta: 0x4,
	lightBlue: 0x8,
	yellow: 0x10,
	lime: 0x20,
	pink: 0x40,
	grey: 0x80,
	lightGrey: 0x100,
	cyan: 0x200,
	purple: 0x400,
	blue: 0x800,
	brown: 0x1000,
	green: 0x2000,
	red: 0x4000,
	black: 0x8000,

	colourToHex(colour) {
		return lookup[colour];
	}
};

