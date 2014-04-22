require "rspec"
require_relative 'task'

describe Task do
	let(:task) { task = Task.new("Walk the dog", "I'm walking the dog") }

	context "#initializing" do
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

	context "#mark_as_complete" do
		it "should set status to complete" do
			task.mark_as_complete!

			expect(task.status).to eq "complete"
		end
	end

	context "#mark_as_incomplete" do
		it "should set status to incomplete" do
			task.mark_as_incomplete!

			expect(task.status).to eq "incomplete"
		end
	end

	context "#complete?" do
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

	context "#initialize" do
		it "should have a title attribute" do
			expect(todo.title).to eq "Home Stuff"
		end

		it "should accept many tasks" do
			expect(todo.list).should have(0).items
		end

	end

	context "#add_task" do
		it "should add task object to todo list" do
			task = Task.new("Walk the dog", "I'm going to walk the dog.")
			todo.add_task(task)
			expect(todo.list).should have(1).items
			expect(todo.list.first).should be_an_instance_of Task
		end
	end

	let(:doggie_list) do
		get_dog = Task.new("Buy a dog", "I'm going to buy a dog")
		train_dog = Task.new("Train the dog", "I'm going to train the dog")
		play_dog = Task.new("Pretend to be a dog", "I'm going to be the dog")
		
		doggie_list = TodoList.new("Doggie List")
		
		doggie_list.add_task(get_dog)
		doggie_list.add_task(train_dog)
		doggie_list.add_task(play_dog)

		doggie_list
	end

	context "#complete_all" do

		it "should mark all tasks complete" do
			doggie_list.complete_all!
			doggie_list.list.each do |task|
				expect(task.status).to eq "complete"
			end
		end
	end

	context "#complete?" do
		it "should return false if not all tasks are complete" do
			expect(doggie_list.complete?).to eq false
		end

		it "should return true if all tasks are complete" do
			doggie_list.complete_all!
			expect(doggie_list.complete?).to eq true
		end
	end

	let(:doggie_list) do 
		get_dog = Task.new("Buy a dog", "I'm going to buy a dog")
		train_dog = Task.new("Train the dog", "I'm going to train the dog")
		walkDog = Task.new("Walk the dog", "I'm going to walk the dog")
		play_dog = Task.new("Pretend to be a dog", "I'm going to be the dog", "complete")
		feedDog = Task.new("Feed the dogs", "Since we're both dogs, we both get fed", "complete")
		
		doggie_list = TodoList.new("Doggie List")
		
		doggie_list.add_task(get_dog)
		doggie_list.add_task(train_dog)
		doggie_list.add_task(walkDog)
		doggie_list.add_task(play_dog)
		doggie_list.add_task(feedDog)

		doggie_list
	end

	context "completed tasks" do
		it "should return array of completed tasks" do 
			expect(doggie_list.completed_tasks).should have(2).items
		end
	end

	context "incomplete tasks" do
		it "should return array of incomplete tasks" do 
			expect(doggie_list.incomplete_tasks).should have(3).items
		end
	end

end