require "spec_helper"

describe "Basic class structures" do

  before(:example) do
    Customer.class_variable_set(:@@all, [])
    Waiter.class_variable_set(:@@all, [])
    Meal.class_variable_set(:@@all, [])
  end

  describe "Customer" do
    describe "#new" do
      it "initializes with a name and age" do
        expect{Customer.new("Ian", 30)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        expect(Customer.all).to eq([])
        ian = Customer.new("Ian", 30)

        expect(Customer.all).to eq([ian])
        niky = Customer.new("Niky", 28)
        expect(Customer.all).to eq([ian, niky])
      end
    end
  end

  describe "Waiter" do
    describe "#new" do
      it "initializes with a name and years of experience" do
        expect{Waiter.new("Ian", 3)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        expect(Waiter.all).to eq([])
        ian = Waiter.new("Ian", 3)

        expect(Waiter.all).to eq([ian])
        niky = Waiter.new("Niky", 2)
        expect(Waiter.all).to eq([ian, niky])
      end
    end
  end

  require "spec_helper"


  describe "Meal" do
    describe "#new" do
      it "initializes with a waiter, a customer, a total and a tip" do
        ian = Customer.new("Ian", 30)
        niky = Waiter.new("Niky", 28)

        expect{Meal.new(niky, ian, 50, 3)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        ian = Customer.new("Ian", 30)
        niky = Waiter.new("Niky", 28)

        expect(Meal.all).to eq([])
        a = Meal.new(niky, ian, 50, 3)
        b = Meal.new(niky, ian, 30, 3)
        expect(Meal.all.length).to eq(2)
        c = Meal.new(niky, ian, 20, 3)
        expect(Meal.all.length).to eq(3)
        expect(Meal.all).to eq([a,b,c])
      end
    end
  end
end

describe "Object relationships" do
  before(:example) do
    Customer.class_variable_set(:@@all, [])
    Waiter.class_variable_set(:@@all, [])
    Meal.class_variable_set(:@@all, [])
  end

  describe "Customer" do
    describe "#new_meal" do
      it "initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip" do
        howard = Customer.new("Howard", 30)
        terrance = Waiter.new("Terrance", 1)
        howard.new_meal(terrance, 10, 1)

        expect(Meal.all.first.waiter).to eq(terrance)
        expect(Meal.all.first.customer).to eq(howard)
      end
    end

    describe "#meals" do
      it "returns an Array of Meal instances associated with this customer" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        howard.new_meal(terrance, 15, 2)
        howard.new_meal(joe, 15, 4)
        howard.new_meal(andrew, 15, 5)
        daniel.new_meal(terrance, 20, 1)
        daniel.new_meal(esmery, 15, 3)

        expect(Meal.all.length).to eq(5)
        expect(howard.meals.length).to eq(3)
        expect(daniel.meals.length).to eq(2)

        expect(howard.meals.first.waiter).to eq(terrance)
        expect(howard.meals.last.waiter).to eq(andrew)
        expect(daniel.meals.first.waiter).to eq(terrance)
        expect(daniel.meals.last.waiter).to eq(esmery)
      end
    end

    describe "#waiters" do
      it "returns an Array of Waiter instances associated with this customer's meals" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        howard.new_meal(terrance, 15, 2)
        howard.new_meal(joe, 15, 4)
        howard.new_meal(andrew, 15, 5)
        daniel.new_meal(terrance, 20, 1)
        daniel.new_meal(esmery, 15, 3)

        expect(howard.waiters).to eq([terrance, joe, andrew])
        expect(daniel.waiters).to eq([terrance, esmery])
      end
    end
  end

  describe "Waiter" do
    describe "#new_meal" do
      it "initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip" do
        howard = Customer.new("Howard", 30)
        terrance = Waiter.new("Terrance", 1)
        terrance.new_meal(howard, 10, 1)

        expect(Meal.all.first.waiter).to eq(terrance)
        expect(Meal.all.first.customer).to eq(howard)
      end
    end

    describe "#meals" do
      it "returns an Array of Meal instances associated with this waiter" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        howard.new_meal(terrance, 15, 2)
        howard.new_meal(joe, 15, 4)
        howard.new_meal(andrew, 15, 5)
        daniel.new_meal(terrance, 20, 1)
        daniel.new_meal(esmery, 15, 3)

        expect(terrance.meals.length).to eq(2)
        expect(terrance.meals.first.customer).to eq(howard)
        expect(terrance.meals.last.customer).to eq(daniel)
      end
    end

    describe "#best_tipper" do
      it "returns the Customer instance associated with the meal that received the largest tip" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        howard.new_meal(terrance, 15, 2)
        daniel.new_meal(terrance, 15, 4)
        lisa.new_meal(terrance, 15, 5)
        josh.new_meal(terrance, 15, 1)
        steven.new_meal(terrance, 15, 3)

        expect(terrance.best_tipper).to eq(lisa)
      end
    end

    describe "#customers" do
      it "returns an array of all the waiter's customers" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        howard.new_meal(terrance, 15, 2)
        howard.new_meal(joe, 15, 4)
        howard.new_meal(andrew, 15, 5)
        daniel.new_meal(terrance, 20, 1)
        daniel.new_meal(esmery, 15, 3)

        expect(terrance.customers).to eq([howard, daniel])
      end
    end

    describe "#most_freq_customer" do
      it "returns the waiter's most frequent customer" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        howard.new_meal(terrance, 15, 2)
        daniel.new_meal(terrance, 15, 4)
        lisa.new_meal(terrance, 15, 5)
        josh.new_meal(terrance, 15, 1)
        steven.new_meal(terrance, 15, 3)
        lisa.new_meal(terrance, 15, 3)

        expect(terrance.most_freq_customer).to eq(lisa)
      end
    end

    describe "#meal_of_worst_tipping_customer" do
      it "returns the meal of the customer who tips the worst" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        meal_1 = howard.new_meal(terrance, 15, 2)
        meal_2 = daniel.new_meal(terrance, 15, 4)
        meal_3 = lisa.new_meal(terrance, 15, 5)
        meal_4 = josh.new_meal(terrance, 15, 1)
        meal_5 = steven.new_meal(terrance, 15, 3)
        meal_6 = lisa.new_meal(terrance, 15, 3)

        expect(terrance.meal_of_worst_tipping_customer).to eq(meal_4)
      end
    end

    describe "#avg_tips" do
      it "returns the avg of tips a waiter makes" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        meal_1 = howard.new_meal(terrance, 15, 2)
        meal_2 = daniel.new_meal(terrance, 15, 4)
        meal_3 = lisa.new_meal(terrance, 15, 5)
        meal_4 = josh.new_meal(terrance, 15, 1)
        meal_5 = steven.new_meal(terrance, 15, 3)
        meal_6 = lisa.new_meal(terrance, 15, 3)

        expect(terrance.avg_tips).to eq(3)
      end
    end

    describe "#all_tips" do
      it "returns all the tips for all waiters meals" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        meal_1 = howard.new_meal(terrance, 15, 2)
        meal_2 = daniel.new_meal(terrance, 15, 4)
        meal_3 = lisa.new_meal(terrance, 15, 5)
        meal_4 = josh.new_meal(terrance, 15, 1)
        meal_5 = steven.new_meal(terrance, 15, 3)
        meal_6 = lisa.new_meal(terrance, 15, 3)

        expect(terrance.all_tips).to eq(18)
      end
    end

    describe "#meal_count" do
      it "returns the number of meals" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        lisa = Customer.new("Lisa", 27)
        josh = Customer.new("Josh", 31)
        steven = Customer.new("Steven", 28)
        terrance = Waiter.new("Terrance", 1)


        meal_1 = howard.new_meal(terrance, 15, 2)
        meal_2 = daniel.new_meal(terrance, 15, 4)
        meal_3 = lisa.new_meal(terrance, 15, 5)
        meal_4 = josh.new_meal(terrance, 15, 1)
        meal_5 = steven.new_meal(terrance, 15, 3)
        meal_6 = lisa.new_meal(terrance, 15, 3)

        expect(terrance.meal_count).to eq(6)
      end
    end

    describe ".most_experienced_waiter" do
      it "returns the waiter instance with the most yrs_experience" do
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        expect(Waiter.most_experienced_waiter).to eq(joe)
      end
    end

    describe ".least_experienced_waiter" do
      it "returns the waiter instance with the least yrs_experience" do
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        expect(Waiter.least_experienced_waiter).to eq(terrance)
      end
    end

    describe ".avg_tips_for_most_and_least_experienced_waiters" do
      it "returns a hash with key value pairs for the avg tips for the most and least experienced waiters" do
        howard = Customer.new("Howard", 30)
        daniel = Customer.new("Daniel", 30)
        terrance = Waiter.new("Terrance", 1)
        joe = Waiter.new("Joe", 10)
        esmery = Waiter.new("Esmery", 2)
        andrew = Waiter.new("Andrew", 3)

        howard.new_meal(terrance, 15, 2)
        howard.new_meal(joe, 15, 4)
        howard.new_meal(andrew, 15, 5)
        daniel.new_meal(terrance, 20, 4)
        daniel.new_meal(esmery, 15, 3)

        expect(Waiter.avg_tips_for_most_and_least_experienced_waiters).to eq({joe=>4,terrance=>3})
      end
    end
  end
end
