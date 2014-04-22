require "rspec"
require_relative 'task'

describe Task do
	let(:task) { task = Task.new("Walk the dog", "I'm walking the dog") }

	context "when initializing" do
		it "should have a title" do
			expect(task.title).to eq "Walk the dog"
		end

		it "should have a description" do
			expect(task.description).to eq "I'm walking the dog"
		end

		it "should have a status" do
			expect(task.status).to eq "incomplete"
		end

		it "should have a created_at timestamp" do
			expect(task.created_at).should be_a_kind_of(Time)
		end
	end

	context "method to mark as complete" do
		it "should set status to complete" do
			task.mark_as_complete!

			expect(task.status).to eq "complete"
		end
	end

	context "method to mark as incomplete" do
		it "should set status to incomplete" do
			task.mark_as_incomplete!

			expect(task.status).to eq "incomplete"
		end
	end

	context "method to check if complete" do
		it "should show the status is complete" do
			task.mark_as_complete!

			expect(task.complete?).to eq true
		end

		it "should show the status is incomplete" do
			task.mark_as_incomplete!

			expect(task.complete?).to eq false
		end
	end
end


describe TodoList do
	let(:todo) { todo = TodoList.new("Home Stuff") }

	context "on initialize" do
		it "should have a title attribute" do
			expect(todo.title).to eq "Home Stuff"
		end

		it "should accept many tasks" do
			expect(todo.list).should have(0).items
		end

	end

	context "add task" do
		it "should add task object to todo list" do
			task = Task.new("Walk the dog", "I'm going to walk the dog.")
			todo.add_task(task)
			expect(todo.list).should have(1).items
			expect(todo.list.first).should be_an_instance_of Task
		end
	end
end