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

	context "#complete_all" do
		getDog = Task.new("Buy a dog", "I'm going to buy a dog")
		trainDog = Task.new("Train the dog", "I'm going to train the dog")
		playDog = Task.new("Pretend to be a dog", "I'm going to be the dog")
		
		doggieList = TodoList.new("Doggie List")
		
		doggieList.add_task(getDog)
		doggieList.add_task(trainDog)
		doggieList.add_task(playDog)

		it "should mark all tasks complete" do
			doggieList.complete_all!
			doggieList.list.each do |task|
				expect(task.status).to eq "complete"
			end
		end
	end

	context "#complete?" do
		getDog = Task.new("Buy a dog", "I'm going to buy a dog")
		trainDog = Task.new("Train the dog", "I'm going to train the dog")
		playDog = Task.new("Pretend to be a dog", "I'm going to be the dog")
		
		doggieList = TodoList.new("Doggie List")
		
		doggieList.add_task(getDog)
		doggieList.add_task(trainDog)
		doggieList.add_task(playDog)

		it "should return false if not all tasks are complete" do
			expect(doggieList.complete?).to eq false
		end

		it "should return true if all tasks are complete" do
			doggieList.complete_all!
			expect(doggieList.complete?).to eq true
		end
	end

	context "completed tasks" do
		getDog = Task.new("Buy a dog", "I'm going to buy a dog")
		trainDog = Task.new("Train the dog", "I'm going to train the dog")
		walkDog = Task.new("Walk the dog", "I'm going to walk the dog")
		playDog = Task.new("Pretend to be a dog", "I'm going to be the dog", "complete")
		feedDog = Task.new("Feed the dogs", "Since we're both dogs, we both get fed", "complete")
		
		doggieList = TodoList.new("Doggie List")
		
		doggieList.add_task(getDog)
		doggieList.add_task(trainDog)
		doggieList.add_task(walkDog)
		doggieList.add_task(playDog)
		doggieList.add_task(feedDog)

		it "should return array of completed tasks" do 
			expect(doggieList.completed_tasks).should have(2).items
		end
	end

	context "incomplete tasks" do
		getDog = Task.new("Buy a dog", "I'm going to buy a dog")
		trainDog = Task.new("Train the dog", "I'm going to train the dog")
		walkDog = Task.new("Walk the dog", "I'm going to walk the dog")
		playDog = Task.new("Pretend to be a dog", "I'm going to be the dog", "complete")
		feedDog = Task.new("Feed the dogs", "Since we're both dogs, we both get fed", "complete")
		
		doggieList = TodoList.new("Doggie List")
		
		doggieList.add_task(getDog)
		doggieList.add_task(trainDog)
		doggieList.add_task(walkDog)
		doggieList.add_task(playDog)
		doggieList.add_task(feedDog)

		it "should return array of incomplete tasks" do 
			expect(doggieList.incomplete_tasks).should have(3).items
		end
	end

end