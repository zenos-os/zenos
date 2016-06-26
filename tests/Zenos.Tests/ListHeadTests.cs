using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;
using OS.Data;
using Xunit;

namespace Zenos.Tests
{
    public class ListHeadTests
    {
        private class ListHead : ILowLevelList<ListHead>
        {
            private static int _id = 0;

            private static int GetId()
            {
                return _id++;
            }

            public ListHead()
            {
                this.Id = GetId();
            }

            public int Id { get; }

            public ListHead Next { get; set; }
            public ListHead Previous { get; set; }

            public override string ToString()
            {
                return Id.ToString();
            }
        }

        public class AfterInit
        {
            private ListHead head = new ListHead();

            public AfterInit()
            {
                head.Init();
            }

            [Fact]
            public void PreviousPointsToSelf()
            {
                Assert.Equal(head, head.Previous);
            }

            [Fact]
            public void NextPointsToSelf()
            {
                Assert.Equal(head, head.Next);
            }
        }

        public class CanAdd
        {
            private ListHead head = new ListHead();
            private ListHead inserted = new ListHead();

            public CanAdd()
            {
                head.Init();
                inserted.Init();

                head.Add(inserted);
            }

            [Fact]
            public void HeadNextShouldBeInserted()
            {
                Assert.Equal(inserted, head.Next);
            }

            [Fact]
            public void HeadPreviousShouldBeInserted()
            {
                Assert.Equal(inserted, head.Previous);
            }

            [Fact]
            public void InsertedPreviousShouldBeHead()
            {
                Assert.Equal(head, inserted.Previous);
            }

            [Fact]
            public void InsertedNextShouldBeHead()
            {
                Assert.Equal(head, inserted.Next);
            }
        }

        public class ListOfFour
        {
            private ListHead head = new ListHead();
            private ListHead two = new ListHead();
            private ListHead three = new ListHead();
            private ListHead tail = new ListHead();

            public ListOfFour()
            {
                head.Init();
                two.Init();
                three.Init();
                tail.Init();

                head.Add(two);
                two.Add(three);
                three.Add(tail);
            }

            [Fact]
            public void HeadIsFirst()
            {
                Assert.False(head.IsFirstOf(head));
                Assert.True(two.IsFirstOf(head));
                Assert.False(three.IsFirstOf(head));
                Assert.False(tail.IsFirstOf(head));
            }

            [Fact]
            public void TailIsLast()
            {
                Assert.False(head.IsLastOf(head));
                Assert.False(two.IsLastOf(head));
                Assert.False(three.IsLastOf(head));
                Assert.True(tail.IsLastOf(head));
            }

            [Fact]
            public void HeadBeforeTwo()
            {
                Assert.Equal(two, head.Next);
                Assert.Equal(head, two.Previous);
            }

            [Fact]
            public void TwoBeforeThree()
            {
                Assert.Equal(three, two.Next);
                Assert.Equal(two, three.Previous);
            }

            [Fact]
            public void ThreeBeforeTail()
            {
                Assert.Equal(tail, three.Next);
                Assert.Equal(three, tail.Previous);
            }

            [Fact]
            public void TailBeforeHead()
            {
                Assert.Equal(head, tail.Next);
                Assert.Equal(tail, head.Previous);
            }
        }

        public class SupportsDeleteEntry
        {
            private ListHead head = new ListHead();
            private ListHead two = new ListHead();
            private ListHead three = new ListHead();
            private ListHead tail = new ListHead();

            public SupportsDeleteEntry()
            {
                head.Init();
                two.Init();
                three.Init();
                tail.Init();

                head.Add(two);
                two.Add(three);
                three.Add(tail);

                two.DeleteEntry();
            }

            [Fact]
            public void HeadBeforeThree()
            {
                Assert.Equal(three, head.Next);
                Assert.Equal(head, three.Previous);
            }

            [Fact]
            public void ThreeBeforeTail()
            {
                Assert.Equal(tail, three.Next);
                Assert.Equal(three, tail.Previous);
            }

            [Fact]
            public void TailBeforeHead()
            {
                Assert.Equal(head, tail.Next);
                Assert.Equal(tail, head.Previous);
            }
        }

        public class SupportsNextAndPreviousAnimal
        {
            private class AnimalList : ILowLevelList<AnimalList>
            {
                public int Age;
                public AnimalList Next { get; set; }
                public AnimalList Previous { get; set; }
            }

            private AnimalList head = new AnimalList();
            private AnimalList two = new AnimalList();
            private AnimalList three = new AnimalList();
            private AnimalList tail = new AnimalList();

            public SupportsNextAndPreviousAnimal()
            {
                head.Age = 5;
                two.Age = 12;
                three.Age = 14;
                tail.Age = 17;

                head.Init();
                two.Init();
                three.Init();
                tail.Init();

                head.Add(two);
                two.Add(three);
                three.Add(tail);
            }

            [Fact]
            public void NextAnimalAge()
            {
                Assert.Equal(12, head.Next.Age);
                Assert.Equal(14, two.Next.Age);
                Assert.Equal(17, three.Next.Age);
                Assert.Equal(5, tail.Next.Age);
            }

            [Fact]
            public void PreviousAnimalAge()
            {
                Assert.Equal(17, head.Previous.Age);
                Assert.Equal(5, two.Previous.Age);
                Assert.Equal(12, three.Previous.Age);
                Assert.Equal(14, tail.Previous.Age);
            }
        }

        public class SupportsDeleteAnimal
        {
            private class AnimalList : ILowLevelList<AnimalList>
            {
                public int Age;
                public AnimalList Next { get; set; }
                public AnimalList Previous { get; set; }
            }

            private AnimalList head = new AnimalList();
            private AnimalList two = new AnimalList();
            private AnimalList three = new AnimalList();
            private AnimalList tail = new AnimalList();

            public SupportsDeleteAnimal()
            {
                var size = Unsafe.SizeOf<AnimalList>();
                Console.WriteLine(size);
                head.Age = 5;
                two.Age = 12;
                three.Age = 14;
                tail.Age = 17;

                head.Init();
                two.Init();
                three.Init();
                tail.Init();

                head.Add(two);
                two.Add(three);
                three.Add(tail);
            }

            [Fact]
            public void NextAnimalAge()
            {
                two.Delete();

                Assert.Equal(14, head.Next.Age);
                Assert.Equal(17, three.Next.Age);
                Assert.Equal(5, tail.Next.Age);

                Assert.Equal(17, head.Previous.Age);
                Assert.Equal(5, three.Previous.Age);
                Assert.Equal(14, tail.Previous.Age);
            }
        }
    }
}