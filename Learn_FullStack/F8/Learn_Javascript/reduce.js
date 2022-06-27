var topics = [
    {
        topic: 'Front-end',
        courses: [
            {
                id: 1,
                title: 'HTML'
            },
            {
                id: 2,
                title: 'Javascript'
            }
        ]
    },
    {
        topic: 'Back-end',
        courses: [
            {
                id: 3,
                title: 'PHP'
            },
            {
                id: 4,
                title: 'NodeJs'
            }
        ]
    }
]

var newCourse = topics.reduce(function(courses,topic){
    return courses.concat(topic.courses);
},[])
//==> Thu về 1 arr gồm các obj chứa các id và title
var htmls = newCourse.map(function(course){
    return `
        <div>
            <h2>${course.title}</h2>
            <p>${course.id}</p>
        </div>
    `
})