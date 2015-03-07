#!/usr/bin/env python

"""
https://github.com/mkenney/Projects
This is a common project where you create a floor of 20 x 20 squares. Using
various commands you tell a turtle to draw a line on the floor. You have move
forward, left or right, lift or drop pen etc. Do a search online for "Turtle
Graphics" for more information. Optional: Allow the program to read in the list
of commands from a file.

Rough implementation of the turtle package.  There is no rotate functionality,
only 90 degree turns (up, right, down, left). If I get bored I might do a full
object-oriented implementation.
"""


from Tkinter import *
import tkMessageBox
import sys

class App:

	def __init__(self, size):

		grid_size = 100

		self.size = size
		self.step_size = size / grid_size;
		self.center = [size / 2, size / 2]
		self.path = [list(self.center)]
		self.position = list(self.center)

		self.create_canvas()

	def create_canvas(self):
		self.root = Tk()
		self.root.title("Turtle Graphics")

		def rootcallback():
			if tkMessageBox.askokcancel("Quit", "Do you really wish to quit?"):
				self.root.destroy()
		self.root.protocol("WM_DELETE_WINDOW", rootcallback)

		self.canvas = Canvas(self.root, width = self.size, height = self.size)
		self.canvas.bind("<Up>", self.move_up)
		self.canvas.bind("<Left>", self.move_left)
		self.canvas.bind("<Down>", self.move_down)
		self.canvas.bind("<Right>", self.move_right)
		self.canvas.pack()

		# The canvas has to have focus to catch the keyboard events
		self.canvas.focus_set()

		# draw some centered grid points
		for a in range(0, self.size, self.step_size):
			for b in range(0, self.size, self.step_size):
				self.canvas.create_line(a - 1, b - 1, a + 1, b - 1)
				self.canvas.create_line(a - 1, b, a + 1, b)
				self.canvas.create_line(a - 1, b + 1, a + 1, b + 1)

	def move_up(self, event = None):
		self.move('up')

	def move_left(self, event = None):
		self.move('left')

	def move_down(self, event = None):
		self.move('down')

	def move_right(self, event = None):
		self.move('right')

	def move(self, direction):
		new_position = list(self.position)

		if 'up' == direction:
			new_position[1] -= self.step_size
		elif 'left' == direction:
			new_position[0] -= self.step_size
		elif 'down' == direction:
			new_position[1] += self.step_size
		elif 'right' == direction:
			new_position[0] += self.step_size
		else:
			return


		if min(new_position) < 0 or max(new_position) > self.size:
			print "You've run off the board!"

		#elif new_position in self.path:
		#	print "You can't cross your own path"

		# render the line
		else:
			self.canvas.create_line(self.position[0], self.position[1], new_position[0], new_position[1], tag = 'turtlePath')
			self.position = list(new_position)
			self.path.append(list(new_position))

	def run(self, commands = ''):
		if '' != commands:
			command_list = []
			for command in commands.lower():
				command_list.append(command)

			command_iterator = iter(command_list)

			def next_command():
				try:
					command = command_iterator.next()
					if 'u' == command:
						self.move_up()
					elif 'l' == command:
						self.move_left()
					elif 'd' == command:
						self.move_down()
					elif 'r' == command:
						self.move_right()
					self.root.after(100, next_command)
				except:
					pass

			self.root.after(100, next_command)

		self.root.mainloop()

	def quit(self):
		self.root.destroy();

app = App(800)

if (len(sys.argv) < 2):
	app.run()

else:
	txt = open(sys.argv[1])
	app.run(txt.read())
